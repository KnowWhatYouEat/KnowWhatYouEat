defmodule KWYE.Assignment3_testAs do
  use KWYE.ConnCase

  test "GET /Ashwag", %{conn: conn} do
    conn = get conn, "/Ashwag"
    assert html_response(conn, 200) =~ "ashwagggg hello"
  end
end
