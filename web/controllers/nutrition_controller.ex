defmodule KWYE.NutritionController do
   use KWYE.Web, :controller

   alias KWYE.Helpers.NDB_API, as: NDB
   alias KWYE.Helpers.Nutrition, as: Nutrition


   @group_order ["Proximates", "Minerals", "Vitamins", "Lipids", "Amino Acids", "Other"]

   defp test_group_order(l, r) when l in @group_order and r in @group_order do
      Enum.find_index(@group_order, &(&1 == l)) <= Enum.find_index(@group_order, &(&1 == r))
   end

   defp test_group_order(l, r) when l in @group_order and not r in @group_order do
      false
   end

   defp test_group_order(l, r) when not l in @group_order and r in @group_order do
      true
   end

   defp test_group_order(l, r) when not l in @group_order and not r in @group_order do
      l <= r
   end



   def search(conn, params) do
      names = for {qid, ndbno} <- params do
         NDB.get_food_report(ndbno)["name"]
      end
      render conn, "search.html",
         save_params: params,
         names: names
   end

   def options(conn, params) do
      %{"ingredient" => ingredient} = params
      save_params = Map.delete(params, "ingredient")

      render conn, "options.html",
         options: NDB.get_search_results(ingredient),
         save_params: save_params,
         next_id: Enum.count(save_params)
   end

   def measures(conn, params) do
      values = for {qid, ndbno} <- params do
         %{"name" => name, "measures" => measures} = NDB.get_food_report(ndbno)
         measures = for {name, _} <- measures do name end

         %{"id" => qid, "name" => name, "measures" => measures, "ndbno" => ndbno}
      end
         |> Enum.sort(&(elem(Integer.parse(&1["id"]), 0) <= elem(Integer.parse(&2["id"]), 0)))

      render conn, "measures.html", form_values: values
   end

   def report(conn, params) do
      params = for {_, [ndbno, measure, amount]} <- params do
         %{ndbno: ndbno, measure: measure, amount: elem(Float.parse(amount), 0)}
      end

      totals = Nutrition.get_totals(params)
         |> Enum.sort(&test_group_order(&1["group"], &2["group"]))
         |> Enum.map(fn(m) -> Map.update!(m, "total", &Float.to_string(&1, decimals: 2)) end)

      render conn, "report.html", results: totals
   end

end
