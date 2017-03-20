defmodule Usecase.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(Usecase.Luxor.AddUserUsecase, [[], [name: :add_user_usecase]]),
            worker(Usecase.Luxor.AddClientUsecase, [[], [name: :add_client_usecase]]),
            worker(Usecase.Luxor.AddDeviceUsecase, [[], [name: :add_device_usecase]]),
            worker(Usecase.Luxor.SaveProducerUsecase, [[], [name: :save_producer_usecase]]),
            worker(Usecase.Luxor.DeleteProducerUsecase, [[], [name: :delete_producer_usecase]]),
            worker(Usecase.Luxor.UpdateProducerUsecase, [[], [name: :update_producer_usecase]]),
            worker(Usecase.Luxor.ListProducerUsecase, [[], [name: :list_producer_usecase]]),
            worker(Usecase.Luxor.GetProducerUsecase, [[], [name: :get_producer_usecase]])
        ]
        opts = [name: Usecase.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
  
end