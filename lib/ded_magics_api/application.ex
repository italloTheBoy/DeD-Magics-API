defmodule DedMagicsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DedMagicsApiWeb.Telemetry,
      # Start the Ecto repository
      DedMagicsApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DedMagicsApi.PubSub},
      # Start the Endpoint (http/https)
      DedMagicsApiWeb.Endpoint
      # Start a worker by calling: DedMagicsApi.Worker.start_link(arg)
      # {DedMagicsApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DedMagicsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DedMagicsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
