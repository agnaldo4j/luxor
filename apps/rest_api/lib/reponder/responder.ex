defmodule Luxor.RestApi.Responder do
    @moduledoc ""

    use Timex

    def login_response(result, conn) do
        case result do
            {:error, _errors} ->
                Plug.Conn.send_resp(conn, 401, prepare_response_without_token(401, "Invalid email or password"))
            {:ok, user} ->
                token = TokenVerification.generate_token
                Plug.Conn.send_resp(conn, 200, prepare_response_with_token(200, user, token))
        end
    end

    def logout_response(conn) do
         Plug.Conn.send_resp(conn, 200, prepare_response_without_token(200, "logout success"))
    end

    defp prepare_response_with_token(status_code, data, token) do
      {_, json} = Poison.encode(%{header: %{time: DateTime.now, httpStatus: status_code, token: token}, body: data})
      json
    end

    defp prepare_response_without_token(status_code, data) do
      {_, json} = Poison.encode(%{header: %{time: DateTime.now, httpStatus: status_code}, body: data})
      json
    end
end