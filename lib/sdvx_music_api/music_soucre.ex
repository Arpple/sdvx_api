defmodule SdvxMusicApi.MusicSource do
  def get_all() do
		SdvxMusicScraper.get_all_sync()
		|> Enum.map(&transform/1)
	end

	defp transform(track) do
		levels = track.levels

		%{
			id: track.id,
			title: track.name,
			artist: track.artist,
			jacket: track.jacket,
			level_nov: levels.nov,
			level_adv: levels.adv,
			level_exh: levels.exh,
			level_mxm: levels.mxm,
			level_inf: levels.inf,
			level_grv: levels.grv,
			level_vvd: levels.vvd,
			level_hvn: levels.hvn,
		}
	end
end
