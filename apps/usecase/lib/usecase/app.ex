defmodule Usecase.App do
    @moduledoc ""

    use Application

    def start(_type, _args) do
        import Supervisor.Spec
        tree = [
            worker(Usecase.Luxor.SaveUserUsecase, [[], [name: :save_user_usecase]]),
            worker(Usecase.Luxor.AuthenticationUserUsecase, [[], [name: :authentication_user_usecase]]),

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
            worker(Usecase.Luxor.GetAnalysisUsecase, [[], [name: :get_analysis_usecase]]),

            worker(Usecase.Luxor.SaveAnimalUsecase, [[], [name: :save_animal_usecase]]),
            worker(Usecase.Luxor.DeleteAnimalUsecase, [[], [name: :delete_animal_usecase]]),
            worker(Usecase.Luxor.UpdateAnimalUsecase, [[], [name: :update_animal_usecase]]),
            worker(Usecase.Luxor.ListAnimalUsecase, [[], [name: :list_animal_usecase]]),
            worker(Usecase.Luxor.GetAnimalUsecase, [[], [name: :get_animal_usecase]]),

            worker(Usecase.Luxor.SaveDeviceUsecase, [[], [name: :save_device_usecase]]),
            worker(Usecase.Luxor.DeleteDeviceUsecase, [[], [name: :delete_device_usecase]]),
            worker(Usecase.Luxor.UpdateDeviceUsecase, [[], [name: :update_device_usecase]]),
            worker(Usecase.Luxor.ListDeviceUsecase, [[], [name: :list_device_usecase]]),
            worker(Usecase.Luxor.GetDeviceUsecase, [[], [name: :get_device_usecase]]),

            worker(Usecase.Luxor.SaveFarmUsecase, [[], [name: :save_farm_usecase]]),
            worker(Usecase.Luxor.DeleteFarmUsecase, [[], [name: :delete_farm_usecase]]),
            worker(Usecase.Luxor.UpdateFarmUsecase, [[], [name: :update_farm_usecase]]),
            worker(Usecase.Luxor.ListFarmUsecase, [[], [name: :list_farm_usecase]]),
            worker(Usecase.Luxor.GetFarmUsecase, [[], [name: :get_farm_usecase]]),

            worker(Usecase.Luxor.SaveManagerUsecase, [[], [name: :save_manager_usecase]]),
            worker(Usecase.Luxor.DeleteManagerUsecase, [[], [name: :delete_manager_usecase]]),
            worker(Usecase.Luxor.UpdateManagerUsecase, [[], [name: :update_manager_usecase]]),
            worker(Usecase.Luxor.ListManagerUsecase, [[], [name: :list_manager_usecase]]),
            worker(Usecase.Luxor.GetManagerUsecase, [[], [name: :get_manager_usecase]]),

            worker(Usecase.Luxor.SaveTransporterUsecase, [[], [name: :save_transporter_usecase]]),
            worker(Usecase.Luxor.DeleteTransporterUsecase, [[], [name: :delete_transporter_usecase]]),
            worker(Usecase.Luxor.UpdateTransporterUsecase, [[], [name: :update_transporter_usecase]]),
            worker(Usecase.Luxor.ListTransporterUsecase, [[], [name: :list_transporter_usecase]]),
            worker(Usecase.Luxor.GetTransporterUsecase, [[], [name: :get_transporter_usecase]]),

            worker(Usecase.Luxor.SaveTruckUsecase, [[], [name: :save_truck_usecase]]),
            worker(Usecase.Luxor.DeleteTruckUsecase, [[], [name: :delete_truck_usecase]]),
            worker(Usecase.Luxor.UpdateTruckUsecase, [[], [name: :update_truck_usecase]]),
            worker(Usecase.Luxor.ListTruckUsecase, [[], [name: :list_truck_usecase]]),
            worker(Usecase.Luxor.GetTruckUsecase, [[], [name: :get_truck_usecase]]),

            worker(Usecase.Luxor.SaveTruckDriverUsecase, [[], [name: :save_truck_driver_usecase]]),
            worker(Usecase.Luxor.DeleteTruckDriverUsecase, [[], [name: :delete_truck_driver_usecase]]),
            worker(Usecase.Luxor.UpdateTruckDriverUsecase, [[], [name: :update_truck_driver_usecase]]),
            worker(Usecase.Luxor.ListTruckDriverUsecase, [[], [name: :list_truck_driver_usecase]]),
            worker(Usecase.Luxor.GetTruckDriverUsecase, [[], [name: :get_truck_driver_usecase]])
        ]
        opts = [name: Usecase.Sup, strategy: :one_for_one]
        Supervisor.start_link(tree, opts)
    end
  
end
