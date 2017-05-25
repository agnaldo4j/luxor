defmodule Usecase.Luxor.UpdateDeviceUsecase do
    @moduledoc ""

    use GenServer
    use Timex

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.UpdateDeviceUsecase, state, opts)
    end

    def handle_call({:update, command = %Command.Device.UpdateDeviceCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Device.UpdateDeviceCommand{}) do
        %Luxor.Device{
            id: command.id,
            serial_number: command.serial_number,
            name: command.name
        } |>
        Persistence.Luxor.DevicePersistenceAdapterApi.update
    end
end