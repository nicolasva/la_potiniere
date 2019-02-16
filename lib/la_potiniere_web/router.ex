defmodule LaPotiniereWeb.Router do
  use LaPotiniereWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug LaPotiniere.AuthService, repo: LaPotiniere.Repo
  end

  pipeline :csrf do
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LaPotiniereWeb do
    pipe_through [:browser, :csrf]

    get "/", PageController, :index
    resources "/auth_sessions", AuthSessionController, only: [:new, :create, :delete]
  end

  scope "/admin", LaPotiniereWeb.AdminPotiniereWeb, as: :admin  do
    pipe_through [:browser, :csrf]

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :edit, :new, :create, :update, :delete]
    resources "/menus", MenuController, only: [:index, :edit, :new, :create, :update, :delete] do
      resources "/sorts", SortController, only: [:index]
      resources "/contents", ContentController, only: [:index, :edit, :new, :create, :update, :delete] do
        resources "/masters", MasterController, only: [:index]
        resources "/sorts", SortController, only: [:index]
      end
      match :get, "/contents/sorts", SortController, only: [:index]
      resources "/photos", PhotoController, only: [:index, :edit, :new, :create, :update, :delete] do
        resources "/masters", MasterController, only: [:index]
      end
      resources "/events", EventController, only: [:index, :edit, :new, :create, :update, :delete] do
        resources "/masters", MasterController, only: [:index]
      end
    end
    match :get, "/menus/sorts", SortController, :index
    resources "/ckeditorfiles", CkeditorFileController, only: [:create]
  end

  scope "/ckeditor", LaPotiniereWeb.AdminPotiniereWeb, as: :ckeditor  do
    #pipe_through [:browser, :csrf]
    pipe_through [:browser]
    resources "/ckeditorfiles", CkeditorFileController, only: [:create, :index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", LaPotiniereWeb do
  #   pipe_through :api
  # end
end
