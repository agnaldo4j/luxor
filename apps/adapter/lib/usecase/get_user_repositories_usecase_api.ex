defmodule Usecase.Kaizen.GetUserRepositoriesUsecaseApi do
    def get_user_repositories(command = %Command.User.GetUserRepositoriesCommand{}) do
        GenServer.call(:get_user_repositories_usecase, {:repositories, command})
    end
end