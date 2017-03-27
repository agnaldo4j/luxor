defmodule Usecase.Luxor.ListClientUserUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListClientUserUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.ClientUser.ListClientUserCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.ClientUser.ListClientUserCommand{}) do
        Persistence.Luxor.ClientUserPersistenceAdapterApi.list
    end
end