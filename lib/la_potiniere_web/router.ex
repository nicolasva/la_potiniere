defmodule LaPotiniereWeb.Router do
  use LaPotiniereWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LaPotiniere.AuthService, repo: LaPotiniere.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LaPotiniereWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/auth_sessions", AuthSessionController, only: [:new, :create, :delete]
  end

  scope "/admin", LaPotiniereWeb.AdminPotiniereWeb, as: :admin  do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :edit, :new, :create, :update, :delete]
    resources "/menus", MenuController, only: [:index, :edit, :new, :create, :update, :delete] do
      resources "/contents", ContentController, only: [:index, :edit, :new, :create, :update, :delete]
    end
    resources "/ckeditorfiles", CkeditorFileController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", LaPotiniereWeb do
  #   pipe_through :api
  # end
end
