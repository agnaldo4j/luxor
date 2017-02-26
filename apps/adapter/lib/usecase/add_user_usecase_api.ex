defmodule Usecase.Luxor.AddUserUsecaseApi do
    def add_new_user(command = %Command.User.AddNewUserCommand{}) do
        GenServer.call(:add_user_usecase, {:add_new_user, command})
    end
end