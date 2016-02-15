defmodule KWYE.Assignment3Test do
  use KWYE.ConnCase

  test "GET /kalyan", %{conn: conn} do
    conn = get conn, "/chris"
    assert html_response(conn, 200) =~ "kalyan hello"
  end
end