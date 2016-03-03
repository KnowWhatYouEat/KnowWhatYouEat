defmodule KWYE.NutritionController do
   use KWYE.Web, :controller

   alias KWYE.Helpers.NDB_API, as: NDB

   def search(conn, _params) do
      render conn, "search.html"
   end

   def options(conn, %{"ingredient" => ingredient} = params) do
      render conn, "options.html", options: NDB.get_search_results(ingredient)
   end

end