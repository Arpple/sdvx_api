defmodule SdvxMusicApi.Music do
	alias SdvxMusicApi.Repo
	alias SdvxMusicApi.Music.Track

  def all_tracks() do
		Repo.all(Track)
	end

	def insert_tracks(tracks) do
		tracks = tracks
		|> Enum.map(&add_timestamp/1)


		Repo.insert_all(
			Track, tracks,
			on_conflict: {:replace_all_except, [:inserted_at]},
			conflict_target: [:id],
		)
	end

	defp add_timestamp(track) do
		now = NaiveDateTime.utc_now()
		|> NaiveDateTime.truncate(:second)

		track
		|> Map.put(:updated_at, now)
		|> Map.put(:inserted_at, now)
	end
end
