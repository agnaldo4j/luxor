# RelationalAdapter

**Acesso a banco de dados relacional usando ecto**

[Adaptadores entre negocio e persistencia](https://github.com/agnaldo4j/luxor/tree/develop/apps/relational_adapter/lib/relational_adapter/luxor/adapter)

[Entidades de acesso a persistencia](https://github.com/agnaldo4j/luxor/tree/develop/apps/relational_adapter/lib/relational_adapter/luxor/entities)

[Execucao de comando na persistencia](https://github.com/agnaldo4j/luxor/tree/develop/apps/relational_adapter/lib/relational_adapter/luxor/repositories)

[Manutencao de esquema](https://github.com/agnaldo4j/luxor/tree/develop/apps/relational_adapter/priv/repository/migrations)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add relationalAdapter to your list of dependencies in `mix.exs`:

        def deps do
          [{:relationalAdapter, "~> 0.0.1"}]
        end

  2. Ensure relationalAdapter is started before your application:

        def application do
          [applications: [:relationalAdapter]]
        end

