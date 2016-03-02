defmodule KWYE.Router do
  use KWYE.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KWYE do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/search", NutritionController, :search
    
    
    get "/chris", Assignment3, :chris
    get "/kalyan", Assignment3, :kalyan
    get "/Ashwag", Assignment3, :ashwag

    get "/chrisapi", Assignment4, :chris
    get "/kalyanboppana", Assignment4, :kalyan
    get "/Gashgari", Assignment4, :ashwag
  end

  # Other scopes may use custom stacks.
  # scope "/api", KWYE do
  #   pipe_through :api
  # end
end
