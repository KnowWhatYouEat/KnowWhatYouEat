defmodule KWYE.Helpers.NDB_API do

   alias KWYE.Helpers.Utility, as: Utility


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
      cache_id = food_id <> to_string(type)
      if report = LruCache.get(:ndb_api_report_cache, cache_id) do
      else
         raw_report = "#{@ndb_base_url}reports/?ndbno=#{food_id}&type=#{report_type_to_string(type)}&format=json&api_key=#{@api_key}"
            |> process_url
            |> Map.get("report")
            |> Map.get("food")

         measures = for m <- hd(raw_report["nutrients"])["measures"], into: %{}, do: {m["label"], m["eqv"]}

         nutrients = raw_report["nutrients"]
            |> Enum.map(fn(nutrient) ->
               nutrient
                  |> Map.update!("value", &(elem(Float.parse(&1), 0)))
                  |> Map.delete("measures")
               end)
            |> Utility.flatten_to_map_by_inner_key("name")

         report = %{"name" => raw_report["name"],
                     "id" => raw_report["ndbno"],
                     "measures" => measures,
                     "nutrients" => nutrients }

         LruCache.put(:ndb_api_report_cache, cache_id, report)
      end
      report
   end

   def get_search_results(food_name, max \\ 50, offset \\ 0) do
      cache_id = food_name <> to_string(max) <> to_string(offset)
      if results = LruCache.get(:ndb_api_search_cache, cache_id) do
      else
         results = "#{@ndb_base_url}search/?format=json&q=#{food_name}&sort=r&max=#{max}&offset=#{offset}&api_key=#{@api_key}"
            |> process_url
            |> Map.get("list")
            |> Map.get("item")
         LruCache.put(:ndb_api_search_cache, cache_id, results)
      end
      results
   end

end