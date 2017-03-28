defmodule AppRouter do
    use Plug.Router

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

    forward "/v1/auth/users", to: UserRouter
    forward "/v1/auth/clients", to: ClientRouter

    match _ do
        send_resp(conn, 404, "app oops")
    end
end
