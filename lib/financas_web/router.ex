defmodule FinancasWeb.Router do
  use FinancasWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FinancasWeb do
    pipe_through :browser

    # Página principal
    get "/", HomeController, :index

    # CRUD de receitas
    resources "/receitas", ReceitaController

    # CRUD de despesas
    resources "/despesas", DespesaController
  end
end
