defmodule FawkesWeb.Router do
  use FawkesWeb, :router

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

  pipeline :guardian do
    plug FawkesWeb.Guardian.Plug
    plug FawkesWeb.Guardian.CurrentUserPlug
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end


  scope "/", FawkesWeb do
    pipe_through [:browser, :guardian, :ensure_auth]
    post("/logout", PageController, :logout)
  end

  scope "/", FawkesWeb do
    # pipe_through :browser # Use the default browser stack
    pipe_through [:browser, :guardian]

    post("/logout", Auth.UserController, :delete)

    get "/talks/:id", TalkController, :show
    get "/", PageController, :index
    get "/about", PageController, :about
    get "/categories/new", CategoryController, :new
    get "/categories/:id", CategoryController, :show
    delete "/category/:id", CategoryController, :delete
    post "/categories", CategoryController, :create
    get "/categories", CategoryController, :index
    resources "/audiences", AudienceController
    resources "/schedule_slots", SlotController
    resources "/speakers", SpeakerController

  end

  scope "/signup", FawkesWeb.Signup, as: :signup do
    pipe_through [:browser, :guardian]

    resources "/", UserController, only: [:new, :create]
  end

  scope "/login", FawkesWeb.Auth, as: :auth do
    pipe_through [:browser, :guardian]

    resources "/", UserController, only: [:new, :create]
  end
  # Other scopes may use custom stacks.
  # scope "/api", FawkesWeb do
  #   pipe_through :api
  # end
end
