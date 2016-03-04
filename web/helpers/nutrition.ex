defmodule KWYE.Helpers.Nutrition do
   alias KWYE.Helpers.NDB_API, as: NDB
   alias KWYE.Helpers.Utility, as: Util


   def get_totals(inputs) do
      for %{ndbno: ndbno, measure: measure, amount: amount} <- inputs do
         report = NDB.get_food_report(ndbno)
         %{^measure => eqv} = report["measures"]
         multiplier = eqv * amount / 100

         for n <- report["nutrients"] do Map.put(n, "total", n["value"] * multiplier) end
            |> Util.flatten_to_map_by_inner_key("nutrient_id", delete_key: false)
      end
         |> Enum.reduce(fn(m, acc) ->
               Map.merge(m, acc, fn(_, l, r) ->
                  Map.merge(l, r, fn(key, v1, v2) ->
                     case key do
                        "total" -> v1 + v2
                        "unit" -> if v1 == v2 do v2 else raise "UnitMismatch" end
                        _ -> v2
                     end
                  end) end) end)
         |> Map.to_list
         |> Enum.map(&elem &1, 1)
   end

end