defmodule RelationalAdapter.Luxor.Migrations.CreateBase do
  use Ecto.Migration

    def up do
        create table(:devices, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
            add :serial_number, :string
            add :name, :string
        end

        create table(:users, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
            add :email, :string
            add :password, :string
            add :active, :boolean
        end

        create table(:clients, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
            add :name, :string
        end

        create table(:client_users, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
            add :client_id, references(:clients, column: :id, type: :string)
            add :user_id, references(:users, column: :id, type: :string)
        end
    end

    def down do
        drop table(:devices)
        drop table(:users)
        drop table(:clients)
        drop table(:client_users)
    end
end
