<<<<<<< HEAD
defmodule KWYE.assignment3_test do
  use KWYE.ConnCase

  test "GET /kalyan", %{conn: conn} do
    conn = get conn, "/kalyan"
    assert html_response(conn, 200) =~ "kalyan hello"
=======
defmodule KWYE.Assignment3Test do
  use KWYE.ConnCase

  test "GET /chris", %{conn: conn} do
    conn = get conn, "/chris"
    assert html_response(conn, 200) =~ "chris hello"
>>>>>>> a5c9b62f360fa3ca3d7a79274dfb4f37dcec5c7e
  end
end
