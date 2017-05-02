defmodule AppRouter do
    use Plug.Router

    plug :match
    plug Corsica, log: [rejected: :debug, invalid: :debug, accepted: :debug], origins: "*", max_age: 600, allow_credentials: true, allow_Methods: ["POST", "GET", "PUT", "DELETE", "OPTIONS"], allow_headers: ~w(Authorization)
    plug :dispatch

    forward "/v1/auth", to: LoginRouter
    forward "/v1/users", to: UserRouter
    forward "/v1/clients", to: ClientRouter

    match _ do
        send_resp(conn, 404, "app oops")
    end
end
