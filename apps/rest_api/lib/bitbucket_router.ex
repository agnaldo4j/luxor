defmodule BitbucketRouter do
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
                  <a href='https://bitbucket.org/site/oauth2/authorize?client_id=3kc2D3pfqetqbaN8je&response_type=code'>Click here</a> to begin!</a>
                </p>
              </body>
            </html>
        "
        send_resp(conn, 200, html_result)
    end

    get "/callback" do
        body = conn |>
        fetch_query_params |>
        send_to_github |>
        read_response_from_github |>
        read_response_body_from_github
        send_resp(conn, 200, body)
    end

    match _ do
        send_resp(conn, 404, "user oops")
    end

    defp send_to_github(conn) do
    IO.inspect(conn.params["code"])
        url = 'https://bitbucket.org/site/oauth2/access_token'
        header = [{'Authorization', to_char_list("Basic "<> Base.encode64("3kc2D3pfqetqbaN8je:3tcsdgmeU5Q6TruS5WdSH4kCU9QRHhgG"))}, {'Accept', '*/*'}]
        type = 'application/x-www-form-urlencoded'
        body = "grant_type=authorization_code&code="<> conn.params["code"]
        IO.inspect(header)
        :httpc.request(:post, {url, header, type, body}, [:ssl, [{:versions,['tlsv1.2']}]], [])
    end

    defp read_response_from_github({:ok, result}) do
      result
    end

    defp read_response_body_from_github({_status, _header, body}) do
      body
    end
end
