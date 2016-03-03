defmodule KWYE.Helpers.Nutrition do
   alias KWYE.Helpers.NDB_API, as: NDB
   alias KWYE.Helpers.Utility, as: Util


   def get_totals(inputs) do
      for %{ndbno: ndbno, measure: measure, amount: amount} <- inputs do
         report = NDB.get_food_report(ndbno)
         %{^measure => eqv} = report["measures"]
         multiplier = eqv * amount / 100

         for n <- report["nutrients"] do Map.put(n, "total", n["value"] * multiplier) end
            |> Util.flatten_to_map_by_inner_key("nutrient_id")
      end
         |> Enum.reduce(fn(m, acc) ->
               Map.merge(m, acc, fn(_, v1, v2) ->
                  Map.put v1, "total", v1["total"] + v2["total"] end) end)
         |> Map.to_list
         |> Enum.map(fn({k,v}) -> Map.put v, "nutrient_id", k end)
   end

end