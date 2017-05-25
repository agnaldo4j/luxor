defmodule Usecase.Luxor.DeleteDeviceUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.DeleteDeviceUsecase, state, opts)
    end

    def handle_call({:delete, command = %Command.Device.DeleteDeviceCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Device.DeleteDeviceCommand{}) do
        %Luxor.Device{id: command.id} |>
        Persistence.Luxor.DevicePersistenceAdapterApi.delete
    end
end