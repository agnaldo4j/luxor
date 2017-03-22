defmodule Usecase.Luxor.SaveDeviceUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.SaveDeviceUsecase, state, opts)
    end

    def handle_call({:save, command = %Command.Device.SaveDeviceCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Device.SaveDeviceCommand{}) do
        %Luxor.Device{name: command.name, serial_number: command.serial_number} |>
        Luxor.Device.identify |>
        Persistence.Luxor.DevicePersistenceAdapterApi.save
    end
end