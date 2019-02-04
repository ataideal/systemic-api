defmodule SystemicSocketWeb.PageController do
  use SystemicSocketWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
