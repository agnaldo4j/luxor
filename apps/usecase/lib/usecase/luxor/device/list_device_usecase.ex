defmodule Usecase.Luxor.ListDeviceUsecase do
    @moduledoc ""

    use GenServer

    def start_link(state, opts \\ []) do
        GenServer.start_link(Usecase.Luxor.ListDeviceUsecase, state, opts)
    end

    def handle_call({:list, command = %Command.Device.ListDeviceCommand{}}, _from, actual_state) do
        result = execute(command)
        {:reply, result, actual_state}
    end

    defp execute(_command = %Command.Device.ListDeviceCommand{}) do
        Persistence.Luxor.DevicePersistenceAdapterApi.list
    end
end
