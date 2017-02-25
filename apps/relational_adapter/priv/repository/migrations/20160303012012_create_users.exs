defmodule RelationalAdapter.Repo.Migrations.CreateUsers do
  use Ecto.Migration

    def up do
        create table(:cards, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:columns, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:issues, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:milestones, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:organizations, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:projects, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:repositories, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
        end

        create table(:teams, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
            add :name, :string
        end

        create table(:users, primary_key: false) do
            add :id, :string, primary_key: true
            add :created, :datetime, default: fragment("now()")
            add :updated, :datetime
            add :user_id, :integer
            add :name, :string
            add :email, :string
            add :password, :string
            add :github_token, :string
        end
    end

    def down do
        drop table(:cards)
        drop table(:columns)
        drop table(:issues)
        drop table(:milestones)
        drop table(:organizations)
        drop table(:projects)
        drop table(:repos)
        drop table(:teams)
        drop table(:users)
    end
end
