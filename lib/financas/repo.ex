defmodule Financas.Repo do
  use Ecto.Repo,
    otp_app: :financas,
    adapter: Ecto.Adapters.Postgres
end
