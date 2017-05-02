defmodule ClientRouter do
    use Plug.Router

    import Joken

    @skip_token_verification %{joken_skip: true}

    plug :match
    plug Joken.Plug, verify: &TokenVerification.verify/0, on_error: &TokenVerification.error_logging/2
    plug :dispatch

    get "/", private: @skip_token_verification do
        send_resp(conn, 200, "client world")
    end

    post "/teste"  do
        send_resp(conn, 200, "client world")
    end

    match _ do
        send_resp(conn, 404, "client oops")
    end
end
