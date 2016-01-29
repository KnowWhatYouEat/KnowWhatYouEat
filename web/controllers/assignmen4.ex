defmodule KWYE.Assignment4 do
  use KWYE.Web, :controller
def ashwag(conn, _params) do 
Paratize.Pool.parallel_exec( [
fn -> :timer.sleep(5000) end,
fn -> html conn, " Ashwag Gashgari HElllo" end])
end
end
