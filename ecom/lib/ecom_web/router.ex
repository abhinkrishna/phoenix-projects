defmodule EcomWeb.Router do
  use EcomWeb, :router

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

  pipeline :admin do
    plug :accepts, ["json"]
  end

  scope "/", EcomWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/api", EcomWeb do
    pipe_through :api
    get "/", TestController, :test
    get "/myorders/:phone", Orders, :my_orders
    post "/order", Orders, :new_order
  end

  scope "/admin/api", EcomWeb do
    pipe_through :admin
    get "/orders", Orders, :get_all_order
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: EcomWeb.Telemetry
    end
  end
end
