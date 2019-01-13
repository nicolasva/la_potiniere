defmodule LaPotiniereWeb.Router do
  use LaPotiniereWeb, :router

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

  scope "/", LaPotiniereWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/admin", LaPotiniereWeb.AdminPotiniereWeb  do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", LaPotiniereWeb do
  #   pipe_through :api
  # end
end
