defmodule FinancasWeb.HomeController do
  use FinancasWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
