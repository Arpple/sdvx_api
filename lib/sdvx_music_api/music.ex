defmodule SdvxMusicApi.Music do
	alias SdvxMusicApi.Repo
	alias SdvxMusicApi.Music.Track

  def all_tracks() do
		Repo.all(Track)
	end
end
