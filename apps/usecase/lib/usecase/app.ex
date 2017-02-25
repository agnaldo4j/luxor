defmodule Usecase.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(Usecase.Kaizen.AddUserUsecase, [[], [name: :add_user_usecase]]),
            worker(Usecase.Kaizen.GetUserRepositoriesUsecase, [[], [name: :get_user_repositories_usecase]]),
            worker(Usecase.Kaizen.GetUserOrganizationsUsecase, [[], [name: :get_user_organizations_usecase]]),
            worker(Usecase.Kaizen.GetUserRootInfoUsecase, [[], [name: :get_user_root_info_usecase]])
        ]
        opts = [name: Usecase.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
  
end