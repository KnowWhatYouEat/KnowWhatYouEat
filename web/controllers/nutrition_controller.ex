defmodule KWYE.NutritionController do
   use KWYE.Web, :controller

   def search(conn, _params) do
      render conn, "search.html"
   end

   def options(conn, %{"ingredient" => ingredient} = params) do
      render conn, "options.html", ingredient: ingredient
   end

end