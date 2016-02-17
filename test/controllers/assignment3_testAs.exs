defmodule KWYE.Assignment3_testAs do
  use KWYE.ConnCase

  test "GET /ashwagg", %{conn: conn} do
    conn = get conn, "/ashwagg"
    assert html_response(conn, 200) =~ "ashwag hello"
  end
end
