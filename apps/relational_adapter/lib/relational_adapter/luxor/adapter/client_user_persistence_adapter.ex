defmodule RelationalAdapter.Luxor.ClientUserPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.ClientUserPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_client_users, _from, actual_state) do
        result = RelationalAdapter.Luxor.ClientUserRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_client_user_by_id, client_user_id}, _from, actual_state) do
        {:reply, %Luxor.ClientUser{id: client_user_id}, actual_state}
    end

    def handle_call({:save_client_user, client_user}, _from, actual_state) do
        execute_transaction(client_user) |>
        process_result_transaction(actual_state)
    end

    defp execute_transaction(client_user) do
        RelationalAdapter.Luxor.Repository.transaction fn ->
            client_user |>
            RelationalAdapter.Luxor.ClientUser.from_business |>
            RelationalAdapter.Luxor.ClientUserRepository.save |>
            RelationalAdapter.Luxor.ClientUser.to_business
        end
    end

    defp process_result_transaction(result, actual_state) do
        case result do
            {:ok, saved_client_user} -> save_client_user_response(saved_client_user.client, actual_state)
            {:error, error} -> save_client_user_response(error, actual_state)
        end
    end

    defp save_client_user_response(client_user, actual_state) do
        {:reply, client_user, actual_state}
    end

    defp list_to_domain() do
        fn(client_user) -> RelationalAdapter.Luxor.ClientUser.to_business(client_user) end
    end
end
