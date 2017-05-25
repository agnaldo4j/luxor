defmodule Usecase.Luxor.GetClientUserUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetClientUserUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.ClientUser.GetClientUserCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.ClientUser.GetClientUserCommand{}) do
        %Luxor.ClientUser{id: command.id} |>
        Persistence.Luxor.ClientUserPersistenceAdapterApi.get
    end
end
