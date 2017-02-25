defmodule GithubRouter do
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
                  We're going to now talk to the GitHub API. Ready?
                  <a href='https://github.com/login/oauth/authorize?scope=user:email%20repo%20gist&client_id=51ee6a9ec82ac710badf'>Click here</a> to begin!</a>
                </p>
                <p>
                  If that link doesn't work, remember to provide your own <a href='/v3/oauth/#web-application-flow'>Client ID</a>!
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
        url = 'https://github.com/login/oauth/access_token'
        header = [{'Accept','application/json'}]
        type = 'application/x-www-form-urlencoded'
        body = "client_id=51ee6a9ec82ac710badf&client_secret=10d2b3f9d1f6d79e7d650be10bd2a3e2b1ca95de&code=" <> conn.params["code"] <> "&accept=json"
        :httpc.request(:post, {url, header, type, body}, [], [])
    end

    defp read_response_from_github({:ok, result}) do
      result
    end

    defp read_response_body_from_github({_status, _header, body}) do
      body
    end
end
 
