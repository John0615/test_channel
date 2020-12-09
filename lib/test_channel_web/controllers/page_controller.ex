defmodule TestChannelWeb.PageController do
  use TestChannelWeb, :controller

  def index(conn, _params) do
    IO.puts(1234)
    TestChannelWeb.Endpoint.broadcast("room", "new_msg", %{aa: "999"})
    render(conn, "index.html")
  end
end
