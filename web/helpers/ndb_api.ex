defmodule KWYE.Helpers.NDB_API do

   @api_key Application.get_env(:k_w_y_e, :ndb_key)

   @ndb_base_url "http://api.nal.usda.gov/ndb/"

   @report_types [:basic, :full, :stats]

   defp report_type_to_string(type) when type in @report_types do
      case type do
         :basic -> "b"
         :full -> "f"
         :stats -> "s"
      end
   end

   defp process_url(url) do
      url
      |> HTTPoison.get!
      |> Map.get(:body)
      |> Poison.decode!
   end


   def get_food_report(food_id, type \\ :basic) when type in @report_types do
      "#{@ndb_base_url}reports/?ndbno=#{food_id}&type=#{report_type_to_string(type)}&format=json&api_key=#{@api_key}"
      |> process_url
      |> Map.get("report")
      |> Map.get("food")
      |> Map.get("nutrients")
      |> Enum.reduce(%{}, fn(nutrient, acc) -> Map.put acc, nutrient["name"], (Map.delete nutrient, "name") end)
   end

   def get_search_results(food_name, max \\ 50, offset \\ 0) do
      "#{@ndb_base_url}search/?format=json&q=#{food_name}&sort=r&max=#{max}&offset=#{offset}&api_key=#{@api_key}"
      |> process_url
      |> Map.get("list")
      |> Map.get("item")
   end

end