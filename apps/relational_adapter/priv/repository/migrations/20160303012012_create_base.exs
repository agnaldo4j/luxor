defmodule RelationalAdapter.Luxor.Migrations.CreateBase do
  use Ecto.Migration

    def up do
        create table(:devices, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :serial_number, :string
            add :name, :string
        end

        create table(:users, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :email, :string
            add :password, :string
            add :active, :boolean
        end

        create table(:clients, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
        end

        create table(:client_users, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :client_id, references(:clients, column: :id, type: :string)
            add :user_id, references(:users, column: :id, type: :string)
        end

        create table(:technical_teams, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
            add :client_id, references(:clients, column: :id, type: :string)
        end

        create table(:technicians, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
        end

        create table(:technical_team_technicians, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :technical_team_id, references(:technical_teams, column: :id, type: :string)
            add :technician_id, references(:technicians, column: :id, type: :string)
        end

        create table(:technician_users, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :technician_id, references(:technicians, column: :id, type: :string)
            add :user_id, references(:users, column: :id, type: :string)
        end

        create table(:transporters, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
        end

        create table(:producers, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
            add :sex, :string
            add :cpf, :string
            add :phone, :string
        end

        create table(:animals, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :register_number, :string
            add :breed, :string
            add :producer_id, references(:producers, column: :id, type: :string)
        end

        create table(:analyzes, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
        end

        create table(:trucks, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
        end

        create table(:truck_drivers, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
        end

        create table(:farms, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime, default: fragment("now()")
            add :name, :string
        end
    end

    def down do
        drop table(:devices)
        drop table(:users)
        drop table(:clients)
        drop table(:client_users)
        drop table(:technical_teams)
        drop table(:technicians)
        drop table(:technical_team_technicians)
        drop table(:transporters)
        drop table(:producers)
        drop table(:animals)
        drop table(:analyzes)
        drop table(:trucks)
        drop table(:truck_drivers)
        drop table(:farms)
    end
end
