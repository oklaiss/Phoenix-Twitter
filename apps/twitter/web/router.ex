defmodule Twitter.Router do
  use Twitter.Web, :router

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

  scope "/", Twitter do
    pipe_through :browser # Use the default browser stack

    get  "/",         PageController, :index
    get  "/feed",     PageController, :show
    post "/newfeed",  PageController, :update
  end

  scope "/auth", Twitter do
    pipe_through :browser

    get    "/:provider",          AuthController, :request
    get    "/:provider/callback", AuthController, :callback
    post   "/:provider/callback", AuthController, :callback
    delete "/logout",             AuthController, :delete
  end

end
