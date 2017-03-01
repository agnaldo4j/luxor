defmodule Usecase.Luxor.AddDeviceUsecase do
    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.AddDeviceUsecase, state, opts)
    end

    def handle_call({:add_new_device, command = %Command.Device.AddNewDeviceCommand{}}, _from, actual_state) do
        saved_device_model = add_new_device(command)
        {:reply, saved_device_model, actual_state}
    end

    defp add_new_device(command = %Command.Device.AddNewDeviceCommand{}) do
        %Luxor.Device{serial_number: command.serial_number, name: command.name} |>
        Luxor.Device.identify |>
        Persistence.Luxor.DevicePersistenceAdapterApi.save
    end
end