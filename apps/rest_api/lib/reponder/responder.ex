defmodule Luxor.RestApi.Responder do
    @moduledoc false

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

    defp prepare_response_with_token(status_code, data, token) do
      #"{\"header\":{\"time\":"+new Date().getTime+",\"httpStatus\":"+status.code+"},\"body\":\""+message+"\"}"

      {_, json} = Poison.encode(%{header: %{time: DateTime.now, httpStatus: status_code, token: token}, body: data})
      json
    end

    defp prepare_response_without_token(status_code, data) do
      #"{\"header\":{\"time\":"+new Date().getTime+",\"httpStatus\":"+status.code+"},\"body\":\""+message+"\"}"
      {_, json} = Poison.encode(%{header: %{time: DateTime.now, httpStatus: status_code}, body: data})
      json
    end
end