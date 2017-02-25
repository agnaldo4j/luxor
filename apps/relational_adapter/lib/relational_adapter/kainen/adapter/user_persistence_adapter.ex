defmodule RelationalAdapter.Kaizen.UserPersistenceAdapter do
    use Timex
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(RelationalAdapter.Kaizen.UserPersistenceAdapter, state, opts)
    end

    def handle_call(:get_all_repos, _from, actual_state) do
        result = RelationalAdapter.Kaizen.UserUsersitory.keyword_query()
        external_list = Enum.map(result, list_to_domain)
        {:reply, external_list, actual_state}
    end

    def handle_call({:find_user_by_id, user_id}, _from, actual_state) do
        {:reply, %Kaizen.User{id: user_id}, actual_state}
    end

    def handle_call({:save_user, user}, _from, actual_state) do
        user |>
        RelationalAdapter.Kaizen.User.from_business |>
        RelationalAdapter.Kaizen.UserRepository.save |>
        RelationalAdapter.Kaizen.User.to_business |>
        save_user_response(actual_state)
    end

    defp save_user_response(user, actual_state) do
        {:reply, user, actual_state}
    end

    defp list_to_domain() do
        fn(resultAdopt) ->
            %Kaizen.User{
                id: resultAdopt.id,
                created: resultAdopt.created,
                updated: resultAdopt.updated
            }
        end
    end
end