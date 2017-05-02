defmodule AppRouter do
    use Corsica.Router

    @opts [
        max_age: 600,
        allow_credentials: true,
        allow_Methods: ["POST", "GET", "PUT", "DELETE", "OPTIONS"],
        allow_headers: ~w(Authorization),
        origins: "*",
    ]

    import Joken

    plug :match
    plug :dispatch

    get "/hello" do
        #user = Usecase.UserServerClient.add_new_user(%UserModel{})
        #users = RelationalAdapter.Server.Client.get_all_users()
        send_resp(conn, 200, "ok")
    end

    get "/anyway" do
        my_token = TokenVerification.generate_token
        send_resp(conn, 200, my_token)
    end

    post "/v1/auth/login", allow_credentials: false do
        conn
        |> my_parse
        |> Command.User.AuthenticationUserCommand.new_from
        |> Usecase.Luxor.UserUsecaseApi.authenticate
        |> login_response(conn)
    end

    forward "/v1/users", to: UserRouter
    forward "/v1/clients", to: ClientRouter

    match _ do
        send_resp(conn, 404, "app oops")
    end

    def login_response(result, conn) do
        case result do
          {:error, _errors} ->
            {_, json} = Poison.encode(%{code: 401, message: "Invalid email or password"})
            send_resp(conn, 401, json)
          {:ok, user} ->
            {_, json} = Poison.encode(user)
            send_resp(conn, 200, json)
        end
    end

    def my_parse(conn) do
        opts = Keyword.put_new([], :parsers, [Plug.Parsers.URLENCODED, Plug.Parsers.MULTIPART])
        Plug.Parsers.call(conn, Plug.Parsers.init(opts))
    end
end
