defmodule RelationalAdapter.Luxor.UserPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Luxor.UserPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_repos, _from, actual_state) do
        result = RelationalAdapter.Luxor.UserRepository.keyword_query()
        external_list = Enum.map(result, list_to_domain())
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_user_by_id, user_id}, _from, actual_state) do
        {:reply, %Luxor.User{id: user_id}, actual_state}
    end

    def handle_call({:save_user, user}, _from, actual_state) do
        user |>
        RelationalAdapter.Luxor.User.from_business |>
        RelationalAdapter.Luxor.UserRepository.save |>
        RelationalAdapter.Luxor.User.to_business |>
        save_user_response(actual_state)
    end

    defp save_user_response(user, actual_state) do
        {:reply, user, actual_state}
    end

    defp list_to_domain() do
        fn(user) -> RelationalAdapter.Luxor.User.to_business(user) end
    end
end
