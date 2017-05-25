defmodule Usecase.Luxor.TransporterUsecaseApi do
    @moduledoc ""

    def save(command = %Command.Transporter.SaveTransporterCommand{}) do
        GenServer.call(:save_transporter_usecase, {:save, command}, 15_000)
    end

    def delete(command = %Command.Transporter.DeleteTransporterCommand{}) do
        GenServer.call(:delete_transporter_usecase, {:delete, command}, 15_000)
    end

    def update(command = %Command.Transporter.UpdateTransporterCommand{}) do
        GenServer.call(:update_transporter_usecase, {:update, command}, 15_000)
    end

    def list(command = %Command.Transporter.ListTransporterCommand{}) do
        GenServer.call(:list_transporter_usecase, {:list, command}, 15_000)
    end

    def get(command = %Command.Transporter.GetTransporterCommand{}) do
        GenServer.call(:get_transporter_usecase, {:get, command}, 15_000)
    end
end
