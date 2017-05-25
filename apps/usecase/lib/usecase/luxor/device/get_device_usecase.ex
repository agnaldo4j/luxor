defmodule Usecase.Luxor.GetDeviceUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.GetDeviceUsecase, state, opts)
    end

    def handle_call({:get, command = %Command.Device.GetDeviceCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(command = %Command.Device.GetDeviceCommand{}) do
        %Luxor.Device{id: command.id} |>
        Persistence.Luxor.DevicePersistenceAdapterApi.get
    end
end