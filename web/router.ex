defmodule AuthDemo.Router do
  use AuthDemo.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AuthDemo do
    pipe_through :api
  end
end
