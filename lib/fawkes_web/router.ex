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

  scope "/", FawkesWeb do
    pipe_through :browser # Use the default browser stack

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

  # Other scopes may use custom stacks.
  # scope "/api", FawkesWeb do
  #   pipe_through :api
  # end
end
