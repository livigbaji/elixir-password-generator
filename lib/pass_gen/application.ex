defmodule PassGen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PassGen.Repo,
      # Start the Telemetry supervisor
      PassGenWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PassGen.PubSub},
      # Start the Endpoint (http/https)
      PassGenWeb.Endpoint
      # Start a worker by calling: PassGen.Worker.start_link(arg)
      # {PassGen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PassGen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PassGenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
