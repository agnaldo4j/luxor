defmodule RestApi.Luxor.Responder do
  use Plug.Router

  def login_response(result) do
    case result do
      {:error, errors} ->
        {_, json} = Poison.encode(%{code: 401, message: "Invalid email or password"})
        send_resp(conn, 401, json)
      {:ok, user} ->
        {_, json} = Poison.encode(user)
        send_resp(conn, 200, json)
    end
  end
  
end