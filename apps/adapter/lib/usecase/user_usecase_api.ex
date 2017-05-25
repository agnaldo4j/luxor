defmodule Usecase.Luxor.UserUsecaseApi do
    @moduledoc ""

    def save(command = %Command.User.SaveUserCommand{}) do
        GenServer.call(:save_user_usecase, {:save, command}, 15_000)
    end

    def authenticate(command = %Command.User.AuthenticationUserCommand{}) do
        GenServer.call(:authentication_user_usecase, {:authenticate, command})
    end
end
