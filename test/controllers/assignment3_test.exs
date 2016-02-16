defmodule KWYE.assignment3_test do
  use KWYE.ConnCase

  test "GET /kalyan", %{conn: conn} do
    conn = get conn, "/kalyan"
    assert html_response(conn, 200) =~ "hello world"
  end
end
