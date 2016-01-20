defmodule KWYE.Assignment3 do
  use KWYE.Web, :controller

  def chris(conn, _params) do
    html conn, "chris hello"
  end

  def kalyan(conn, _params) do
    html conn, "kalyan hello"
  end

  def ashwag(conn, _params) do
    html conn, "ashwagggg hello"
  end
end
