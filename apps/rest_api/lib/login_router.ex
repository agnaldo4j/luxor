defmodule LoginRouter do
    @moduledoc ""

    use Plug.Router

    @skip_token_verification %{joken_skip: true}

    import Joken

    plug :match
    plug Joken.Plug, verify: &TokenVerification.verify/0, on_error: &TokenVerification.error_logging/2
    plug :dispatch

    post "/login", private: @skip_token_verification do
      conn
      |> my_parse
      |> Command.User.AuthenticationUserCommand.new_from
      |> Usecase.Luxor.UserUsecaseApi.authenticate
      |> Luxor.RestApi.Responder.login_response(conn)
    end

    get "/logout" do
      conn
      |> Luxor.RestApi.Responder.logout_response
    end

    match _ do
      send_resp(conn, 404, "app oops")
    end

    def my_parse(conn) do
      opts = Keyword.put_new([], :parsers, [Plug.Parsers.URLENCODED, Plug.Parsers.MULTIPART])
      Plug.Parsers.call(conn, Plug.Parsers.init(opts))
    end
end
