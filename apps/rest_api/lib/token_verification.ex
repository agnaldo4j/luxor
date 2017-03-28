defmodule TokenVerification do
    import Joken

    def generate_token do
        %{
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