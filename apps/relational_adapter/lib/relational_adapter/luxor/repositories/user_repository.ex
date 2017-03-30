defmodule RelationalAdapter.Luxor.UserRepository do
    import Ecto.Query

    def save(changeset) do
        case RelationalAdapter.Luxor.Repository.insert(changeset) do
          {:error, changeset} -> {:error, changeset.errors}
          {:ok, struct} -> {:ok, struct}
        end
    end

    def update(changeset) do
        case RelationalAdapter.Luxor.Repository.update(changeset) do
            {:error, changeset} -> {:error, changeset.errors}
            {:ok, struct} -> {:ok, struct}
        end
    end

    def delete(changeset) do
      case RelationalAdapter.Luxor.Repository.delete(changeset) do
          {:error, changeset} -> {:error, changeset.errors}
          {:ok, struct} -> {:ok, struct}
      end
    end

    def get(id) do
      RelationalAdapter.Luxor.Repository.get!(RelationalAdapter.Luxor.User, id)
      |> build_optional_result([id: {"not found", []}])
    end

    def find_by_email_and_password(user) do
        RelationalAdapter.Luxor.Repository.get_by(RelationalAdapter.Luxor.User, [email: user.email, password: user.password])
        |> build_optional_result([password: {"maybe can be Wrong", []}, email: {"maybe can be Wrong", []}])
    end

    def build_optional_result(result, message) do
      case result do
        nil -> {:error, message}
        _ -> {:ok, result}
      end
    end

    def get_all do
        query = from w in RelationalAdapter.Luxor.User, select: w
        RelationalAdapter.Luxor.Repository.all(query)
    end
end
