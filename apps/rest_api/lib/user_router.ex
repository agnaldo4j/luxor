defmodule UserRouter do
    use Plug.Router

    import Joken

    @skip_token_verification %{joken_skip: true}

    plug :match
    plug Joken.Plug, verify: &TokenVerification.verify/0, on_error: &TokenVerification.error_logging/2
    plug :dispatch



    match _ do
        send_resp(conn, 404, "user oops")
    end
end
