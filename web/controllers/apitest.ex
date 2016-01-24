defmodule KWYE.Apitest do
  use KWYE.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
