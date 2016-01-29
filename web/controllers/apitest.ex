defmodule KWYE.Apitest do
  use KWYE.Web, :controller
  
  @api_key Application.get_env( :kwye, :ndb_key )


  def index(conn, _params) do
    text conn, (HTTPoison.get! "http://api.nal.usda.gov/ndb/reports/?ndbno=01009&type=b&format=json&api_key=" <> @api_key).body
  end
end
