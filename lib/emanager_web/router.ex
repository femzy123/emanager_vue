defmodule EmanagerWeb.Router do
  use EmanagerWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router, otp_app: :emanager

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # BEGIN added for Pow
  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EmanagerWeb do
    pipe_through [:browser, :protected]

    get "/", PageController, :index
  end

  scope "/", EmanagerWeb do
    pipe_through :browser

    
  end

  # Other scopes may use custom stacks.
  # scope "/api", EmanagerWeb do
  #   pipe_through :api
  # end
end
