defmodule KWYE.PageController do
  use KWYE.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
 def contact(conn, params) do

      render conn, "contact.html"
   end
 def about(conn, params) do

      render conn, "about.html"
   end


end

