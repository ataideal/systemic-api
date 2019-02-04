defmodule SystemicSocketWeb.Router do
  use SystemicSocketWeb, :router

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

  scope "/", SystemicSocketWeb do
    pipe_through :browser

    #get "/", PageController, :index
  end

  #Other scopes may use custom stacks.
  scope "/api", SystemicSocketWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    post "/login", UserController, :login
  end
end
