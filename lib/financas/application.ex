defmodule Financas.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FinancasWeb.Telemetry,
      Financas.Repo,
      {DNSCluster, query: Application.get_env(:financas, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Financas.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Financas.Finch},
      # Start a worker by calling: Financas.Worker.start_link(arg)
      # {Financas.Worker, arg},
      # Start to serve requests, typically the last entry
      FinancasWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Financas.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FinancasWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
