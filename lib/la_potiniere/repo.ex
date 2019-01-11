defmodule LaPotiniere.Repo do
  use Ecto.Repo,
    otp_app: :la_potiniere,
    adapter: Ecto.Adapters.Postgres
end
