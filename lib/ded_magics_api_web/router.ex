defmodule DedMagicsApiWeb.Router do
  use DedMagicsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DedMagicsApiWeb do
    pipe_through :api
  end
end
