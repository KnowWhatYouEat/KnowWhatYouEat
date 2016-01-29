defmodule KWYE.Assignment4 do
  use KWYE.Web, :controller
def kalyan(conn, _params) do
    html conn, Poison.Parser.parse!(~s({"name": "Devin Torres", "age": 27}))["name"]
  end

end
