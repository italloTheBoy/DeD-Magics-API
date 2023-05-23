defmodule DedMagicsApi.Repo do
  use Ecto.Repo,
    otp_app: :ded_magics_api,
    adapter: Ecto.Adapters.Postgres
end
