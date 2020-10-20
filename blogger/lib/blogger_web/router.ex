defmodule BloggerWeb.Router do
  use BloggerWeb, :router

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

  scope "/", BloggerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", BloggerWeb do
    pipe_through :api
    # User API's
    get "/users", UserController, :all_users
    post "/user/create",  UserController, :create
    patch "/user/update/:id", UserController, :update
    delete "/user/delete/:id", UserController, :delete
    # Post API's
    get "/posts", PostController, :all_posts
    post "/post/create", PostController, :create
    get "/user/:id/posts", PostController, :posts_by_user
    delete "/post/delete/:id", PostController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", BloggerWeb do
  #   pipe_through :api
  # end

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
      live_dashboard "/dashboard", metrics: BloggerWeb.Telemetry
    end
  end
end
