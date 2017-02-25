defmodule TrelloRouter do
    use Plug.Router

    plug :match
    plug :dispatch

    get "/login" do
        html_result = "
            <html>
              <head>
              </head>
              <body>
                <p>
                  Well, hello there!
                </p>
                <p>
                  We're going to now talk to the Bitbucket API. Ready?
                  <a href='https://trello.com/1/authorize?callback_method=fragment&scope=read&expiration=never&name=DevMonkey&return_url=http://localhost:4000/trello/callback?&key=f0e838347ebe54fcc001328cd8ccf409'>Click here</a> to begin!</a>
                </p>
              </body>
            </html>
        "
        send_resp(conn, 200, html_result)
    end

    post "/callback" do
        body = conn |>
        fetch_query_params
        #send_to_github |>
        #read_response_from_github |>
        #read_response_body_from_github
        IO.inspect(Plug.Conn.read_body(conn))
        IO.inspect(conn.query_string)

        send_resp(conn, 200, "teste")
    end

    match _ do
        send_resp(conn, 404, "user oops")
    end

    #defp send_to_github(conn) do
    #    IO.inspect(conn.params["code"])
    #end

    #defp read_response_from_github({:ok, result}) do
    #  result
    #end

    defp read_response_body_from_github({_status, _header, body}) do
      body
    end
end
