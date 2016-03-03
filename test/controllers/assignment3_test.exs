defmodule KWYE.Assignment3Test do
  use KWYE.ConnCase

  test "GET /chris", %{conn: conn} do
    conn = get conn, "/chris"
    assert html_response(conn, 200) =~ "chris hello"
  end

   test "GET /Ashwag", %{conn: conn} do
      conn = get conn, "/Ashwag"
      assert html_response(conn, 200) =~ "ashwagggg hello"
   end

end
