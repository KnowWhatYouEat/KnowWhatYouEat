defmodule KWYE.Assignment4 do
  use KWYE.Web, :controller
  
  @api_key Application.get_env( :kwye, :ndb_key )


  def chris(conn, _params) do
    text conn, (HTTPoison.get! "http://api.nal.usda.gov/ndb/reports/?ndbno=01009&type=b&format=json&api_key=" <> @api_key).body
  end

  def kalyan(conn, _params) do
    html conn, Poison.Parser.parse!(~s({"name": "Devin Torres", "age": 27}))["name"]
  end
end
