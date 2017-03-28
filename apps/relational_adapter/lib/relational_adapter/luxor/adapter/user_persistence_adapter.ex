defmodule RelationalAdapter.Luxor.UserPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.UserPersistenceAdapter, state, opts)
    end

    def handle_call({:save, manager}, _from, actual_state) do
        manager |>
        RelationalAdapter.Luxor.User.from_business |>
        RelationalAdapter.Luxor.UserRepository.save |>
        RelationalAdapter.Luxor.User.to_business |>
        response(actual_state)
    end

    def handle_call({:delete, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.UserRepository.get |>
        RelationalAdapter.Luxor.UserRepository.delete |>
        RelationalAdapter.Luxor.User.to_business |>
        response(actual_state)
    end

    def handle_call({:update, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.UserRepository.get |>
        RelationalAdapter.Luxor.User.change_state_to(manager) |>
        RelationalAdapter.Luxor.UserRepository.update |>
        RelationalAdapter.Luxor.User.to_business |>
        response(actual_state)
    end

    def handle_call({:list}, _from, actual_state) do
        result = RelationalAdapter.Luxor.UserRepository.get_all()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:get, manager}, _from, actual_state) do
        manager.id |>
        RelationalAdapter.Luxor.UserRepository.get |>
        RelationalAdapter.Luxor.User.to_business |>
        response(actual_state)
    end

    def handle_call({:find_by_email_and_password, user}, _from, actual_state) do
      user |>
      RelationalAdapter.Luxor.UserRepository.find_by_email_and_password |>
      RelationalAdapter.Luxor.User.to_business |>
      response(actual_state)
    end

    defp response(manager, actual_state) do
        {:reply, manager, actual_state}
    end

    defp list_to_domain() do
        fn(manager) -> RelationalAdapter.Luxor.User.to_business(manager) end
    end
end
