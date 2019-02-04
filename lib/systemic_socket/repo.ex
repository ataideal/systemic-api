defmodule SystemicSocket.Repo do
  use Ecto.Repo,
    otp_app: :systemic_socket,
    adapter: Ecto.Adapters.Postgres
end
