defmodule SdvxMusicApiWeb.TrackController do
  use SdvxMusicApiWeb, :controller

	alias SdvxMusicApi.Music

	def index(conn, _params) do
		tracks = Music.all_tracks(read_query_params(conn))
		render(conn, "index.json", tracks: tracks)
	end

	defp read_query_params(conn) do
		conn.query_params
		|> Enum.reduce([], fn {key, value}, kw_list ->
			case key do
				"level" -> Keyword.put(kw_list, :level, value)
				"keyword" -> Keyword.put(kw_list, :keyword, value)
				_ -> kw_list
			end
		end)
	end

end
