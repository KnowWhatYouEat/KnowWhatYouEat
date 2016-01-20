defmodule HelloPhoenix.Assignment3 do
  use HelloPhoenix.Web, :controller

  def chris(conn, _params) do
    html conn, "chris hello"
  end

  def newpage(conn, _params) do
    html conn, "new hello"
  end

  def thing(conn, _params) do
    html conn, "new thing"
  end
end
