defmodule Usecase.App do
    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(Usecase.Luxor.AddUserUsecase, [[], [name: :add_user_usecase]]),
            worker(Usecase.Luxor.AddDeviceUsecase, [[], [name: :add_device_usecase]]),

            worker(Usecase.Luxor.SaveClientUserUsecase, [[], [name: :save_client_user_usecase]]),
            worker(Usecase.Luxor.UpdateClientUserUsecase, [[], [name: :update_client_user_usecase]]),
            worker(Usecase.Luxor.DeleteClientUserUsecase, [[], [name: :delete_client_user_usecase]]),
            worker(Usecase.Luxor.ListClientUserUsecase, [[], [name: :list_client_user_usecase]]),
            worker(Usecase.Luxor.GetClientUserUsecase, [[], [name: :get_client_user_usecase]]),

            worker(Usecase.Luxor.SaveProducerUsecase, [[], [name: :save_producer_usecase]]),
            worker(Usecase.Luxor.DeleteProducerUsecase, [[], [name: :delete_producer_usecase]]),
            worker(Usecase.Luxor.UpdateProducerUsecase, [[], [name: :update_producer_usecase]]),
            worker(Usecase.Luxor.ListProducerUsecase, [[], [name: :list_producer_usecase]]),
            worker(Usecase.Luxor.GetProducerUsecase, [[], [name: :get_producer_usecase]]),

            worker(Usecase.Luxor.SaveAnalysisUsecase, [[], [name: :save_analysis_usecase]]),
            worker(Usecase.Luxor.DeleteAnalysisUsecase, [[], [name: :delete_analysis_usecase]]),
            worker(Usecase.Luxor.UpdateAnalysisUsecase, [[], [name: :update_analysis_usecase]]),
            worker(Usecase.Luxor.ListAnalysisUsecase, [[], [name: :list_analysis_usecase]]),
            worker(Usecase.Luxor.GetAnalysisUsecase, [[], [name: :get_analysis_usecase]])
        ]
        opts = [name: Usecase.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
  
end