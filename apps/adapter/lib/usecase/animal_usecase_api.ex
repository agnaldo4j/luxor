defmodule Usecase.Luxor.AnimalUsecaseApi do
    def save(command = %Command.Animal.SaveAnimalCommand{}) do
        GenServer.call(:save_animal_usecase, {:save, command}, 15000)
    end

    def delete(command = %Command.Animal.DeleteAnimalCommand{}) do
        GenServer.call(:delete_animal_usecase, {:delete, command}, 15000)
    end

    def update(command = %Command.Animal.UpdateAnimalCommand{}) do
        GenServer.call(:update_animal_usecase, {:update, command}, 15000)
    end

    def list(command = %Command.Animal.ListAnimalCommand{}) do
        GenServer.call(:list_animal_usecase, {:list, command}, 15000)
    end

    def get(command = %Command.Animal.GetAnimalCommand{}) do
        GenServer.call(:get_animal_usecase, {:get, command}, 15000)
    end
end