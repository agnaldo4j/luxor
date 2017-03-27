defmodule AppRouter do
  use Plug.Router

  import Joken

  @skip_token_verification %{joken_skip: true}

  plug :match
  plug Joken.Plug, verify: &AppRouter.verify/0, on_error: &AppRouter.error_logging/2
  plug :dispatch

  get "/hello" do
    #user = Usecase.UserServerClient.add_new_user(%UserModel{})
    #users = RelationalAdapter.Server.Client.get_all_users()
    send_resp(conn, 200, "ok")
  end

  get "/anyway", private: @skip_token_verification do
    _my_token = %{
        exp: current_time() + (2 * 60 * 60),
        iat: current_time(),
        nbf: current_time() - 1,
        iss: "Joken Showcase Server",
        aud: "RESTCLIENT",
        jti: "AAAAAAAAAA",
        user_id: 1
    }
    |> token
    |> with_signer(hs256("my_secrethdkhfaskdfhasfhasjdfhasldkfhasljkdfalskdhfahufherbia"))
    |> sign
    |> get_compact

    #users = RelationalAdapter.Server.Client.get_all_users()

    #user = Usecase.UserServerClient.add_new_user(%UserModel{})
    # {_, client_result} = Poison.encode(user)
    send_resp(conn, 200, "ok")
  end

  forward "/users", to: UserRouter, private: @skip_token_verification

  match _, private: @skip_token_verification do
    send_resp(conn, 404, "app oops")
  end

  def verify do
    %Joken.Token{}
    |> with_json_module(Poison)
    |> with_exp
    |> with_iat
    |> with_nbf
    |> with_iss("Joken Showcase Server")
    |> with_aud("RESTCLIENT")
    |> with_validation("exp", &(&1 > current_time()))
    |> with_validation("iat", &(&1 < current_time()))
    |> with_validation("nbf", &(&1 < current_time()))
    |> with_validation("iss", &(&1 == "Joken Showcase Server"))
    |> with_validation("aud", &(&1 == "RESTCLIENT"))
    |> with_validation("user_id", &(&1 == 1))
    |> with_validation("jti", &(&1 == "AAAAAAAAAA"))
    |> with_signer(hs256("my_secrethdkhfaskdfhasfhasjdfhasldkfhasljkdfalskdhfahufherbia"))
  end

  def error_logging(conn, message) do
    {conn, message}
  end
end
