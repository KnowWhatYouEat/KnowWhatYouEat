defmodule KWYE.NutritionController do
   use KWYE.Web, :controller

   def search(conn, _params) do
      render conn, "search.html"
   end

   def options(conn, _params) do
      render conn, "options.html"
   end

end