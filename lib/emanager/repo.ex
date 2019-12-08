defmodule Emanager.Repo do
  use Ecto.Repo,
    otp_app: :emanager,
    adapter: Ecto.Adapters.Postgres
end
