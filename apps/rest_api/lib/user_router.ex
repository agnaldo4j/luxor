defmodule UserRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "user world")
  end

  match _ do
    send_resp(conn, 404, "user oops")
  end
end
