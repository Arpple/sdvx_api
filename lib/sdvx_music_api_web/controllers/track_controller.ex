defmodule SdvxMusicApiWeb.TrackController do
  use SdvxMusicApiWeb, :controller

	alias SdvxMusicApi.Music

	def index(conn, _params) do
		tracks = Music.all_tracks()
		render(conn, "index.json", tracks: tracks)
	end
end
