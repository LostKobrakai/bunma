defmodule Bunma.Repo do
  use Ecto.Repo,
    otp_app: :bunma,
    adapter: Ecto.Adapters.Postgres
end
