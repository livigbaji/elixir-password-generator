defmodule PassGen.Repo do
  use Ecto.Repo,
    otp_app: :pass_gen,
    adapter: Ecto.Adapters.Postgres
end
