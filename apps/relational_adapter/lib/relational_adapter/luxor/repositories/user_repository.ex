defmodule RelationalAdapter.Luxor.UserRepository do
    import Ecto.Query

    def save(changeset) do
        RelationalAdapter.Luxor.Repository.insert!(changeset)
    end

    def update(changeset) do
        RelationalAdapter.Luxor.Repository.update!(changeset)
    end

    def delete(changeset) do
      RelationalAdapter.Luxor.Repository.delete!(changeset)
    end

    def get(id) do
      RelationalAdapter.Luxor.Repository.get!(RelationalAdapter.Luxor.User, id)
    end

    def find_by_email_and_password(user) do
        RelationalAdapter.Luxor.Repository.get_by(RelationalAdapter.Luxor.User, [email: user.email, password: user.password])
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.User, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
