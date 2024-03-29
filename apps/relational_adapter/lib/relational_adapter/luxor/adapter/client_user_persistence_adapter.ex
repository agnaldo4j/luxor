defmodule RelationalAdapter.Luxor.ClientUserPersistenceAdapter do
    @moduledoc ""

    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.ClientUserPersistenceAdapter, state, opts)
    end

    def handle_call({:save, client_user}, _from, actual_state) do
        client_user
        |> execute_transaction
        |> result_transaction(actual_state)
    end

    def handle_call({:update, client_user}, _from, actual_state) do
        client_user
        |> execute_update_transaction
        |> result_transaction(actual_state)
    end

    def handle_call({:delete, client_user}, _from, actual_state) do
        client_user
        |> execute_delete_transaction
        |> result_transaction(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.ClientUserRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, client_user}, _from, actual_state) do
        result = client_user.id |>
        RelationalAdapter.Luxor.ClientUserRepository.get |>
        response(actual_state)
    end

    defp execute_delete_transaction(client_user) do
        RelationalAdapter.Luxor.Repository.transaction fn ->
            client_user.id |>
            RelationalAdapter.Luxor.ClientUserRepository.get |>
            RelationalAdapter.Luxor.ClientUserRepository.delete |>
            RelationalAdapter.Luxor.ClientRepository.delete |>
            RelationalAdapter.Luxor.UserRepository.delete |>
            RelationalAdapter.Luxor.ClientUser.to_business
        end
    end

    defp execute_update_transaction(client_user) do
        RelationalAdapter.Luxor.Repository.transaction fn ->
            client_user.id |>
            RelationalAdapter.Luxor.ClientUserRepository.get |>
            RelationalAdapter.Luxor.ClientUser.change_state_to(client_user) |>
            RelationalAdapter.Luxor.ClientUserRepository.update |>
            RelationalAdapter.Luxor.ClientUser.to_business
        end
    end

    defp execute_transaction(client_user) do
        RelationalAdapter.Luxor.Repository.transaction fn ->
            client_user |>
            RelationalAdapter.Luxor.ClientUser.from_business |>
            RelationalAdapter.Luxor.ClientUserRepository.save |>
            RelationalAdapter.Luxor.ClientUser.to_business
        end
    end

    defp result_transaction(result, actual_state) do
        case result do
            {:ok, saved_client_user} -> response(saved_client_user, actual_state)
            {:error, error} -> response(error, actual_state)
        end
    end

    defp response(client_user, actual_state) do
        {:reply, client_user, actual_state}
    end

    defp list_to_domain() do
        fn(client_user) -> RelationalAdapter.Luxor.ClientUser.to_business(client_user) end
    end
end
