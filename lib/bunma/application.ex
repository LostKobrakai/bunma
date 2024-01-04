defmodule Bunma.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BunmaWeb.Telemetry,
      Bunma.Repo,
      {DNSCluster, query: Application.get_env(:bunma, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Bunma.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Bunma.Finch},
      # Start a worker by calling: Bunma.Worker.start_link(arg)
      # {Bunma.Worker, arg},
      # Start to serve requests, typically the last entry
      BunmaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bunma.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BunmaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
