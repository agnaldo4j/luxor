defmodule Usecase.Kaizen.GetUserRootInfoUsecaseApi do
    def get_user_root_info(command = %Command.User.GetUserRootInfoCommand{}) do
        GenServer.call(:get_user_root_info_usecase, {:get_user_root_info, command})
    end
end