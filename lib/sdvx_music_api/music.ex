defmodule SdvxMusicApi.Music do
	alias SdvxMusicApi.Repo
	alias SdvxMusicApi.Music.Track
	import Ecto.Query

	def all_tracks(filters \\ []) do
		q = from t in Track

		filters
		|> Enum.reduce(q, &filter_tracks/2)
		|> Repo.all()
	end

	def insert_tracks(tracks) do
		tracks
		|> Enum.map(&add_timestamp/1)
		|> Enum.chunk_every(500)
		|> Enum.each(fn chunk ->
			Repo.insert_all(
				Track, chunk,
				on_conflict: {:replace_all_except, [:inserted_at]},
				conflict_target: [:id],
			)
		end)
	end

	defp filter_tracks({:level, level}, query) do
		from t in query,
			where: t.level_nov == ^level or
				t.level_adv == ^level or
				t.level_exh == ^level or
				t.level_mxm == ^level or
				t.level_inf == ^level or
				t.level_grv == ^level or
				t.level_hvn == ^level or
				t.level_vvd == ^level
	end

	defp filter_tracks({:keyword, keyword}, query) do
		from t in query,
			where: ilike(t.title, ^"%#{keyword}%") or
				ilike(t.artist, ^"%#{keyword}%")
	end

	defp filter_tracks(_unsupport_filter, query), do: query

	defp add_timestamp(track) do
		now = NaiveDateTime.utc_now()
		|> NaiveDateTime.truncate(:second)

		track
		|> Map.put(:updated_at, now)
		|> Map.put(:inserted_at, now)
	end
end
