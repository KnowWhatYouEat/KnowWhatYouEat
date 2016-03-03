defmodule KWYE.NutritionController do
   use KWYE.Web, :controller

   alias KWYE.Helpers.NDB_API, as: NDB

   def search(conn, params) do
      render conn, "search.html",
         save_params: params
   end

   def options(conn, params) do
      %{"ingredient" => ingredient} = params
      save_params = Map.delete(params, "ingredient")
      
      render conn, "options.html",
         options: NDB.get_search_results(ingredient),
         save_params: save_params,
         next_id: Enum.count(save_params)
   end

end