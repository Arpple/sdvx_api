defmodule SdvxMusicApi.Repo do
  use Ecto.Repo,
    otp_app: :sdvx_music_api,
    adapter: Ecto.Adapters.Postgres
end
