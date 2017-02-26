defmodule RelationalAdapter.Luxor.Migrations.CreateBase do
  use Ecto.Migration

    def up do
        create table(:devices, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:users, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
            add :name, :string
            add :email, :string
            add :password, :string
        end
    end

    def down do
        drop table(:devices)
        drop table(:users)
    end
end
