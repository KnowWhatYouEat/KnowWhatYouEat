defmodule HelloPhoenix.Assignment3 do
  use HelloPhoenix.Web, :controller

  def chris(conn, _params) do
    html conn, "chris hello"
  end
  def kalyan(conn, _params) do
    html conn, "kalyan hello"
  end
end
