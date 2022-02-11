defmodule SdvxMusicApiWeb.TrackView do
  use SdvxMusicApiWeb, :view

	def render("index.json", %{tracks: tracks}) do
		%{data: render_many(tracks, SdvxMusicApiWeb.TrackView, "track.json")}
	end

	def render("track.json", %{track: track}) do
		%{
			id: track.id, title: track.title, artist: track.artist, jacket: track.jacket,
			levels: %{
				nov: track.level_nov,
				adv: track.level_adv,
				exh: track.level_exh,
				mxm: track.level_mxm,

				inf: track.level_inf,
				grv: track.level_grv,
				hvn: track.level_hvn,
				vvd: track.level_vvd,
			}
		}
	end
end
