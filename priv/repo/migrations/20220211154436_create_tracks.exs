defmodule SdvxMusicApi.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks, primary_key: false) do
      add :id, :string, primary_key: true
      add :title, :string
      add :artist, :string
      add :jacket, :string
      add :level_nov, :integer
      add :level_adv, :integer
      add :level_exh, :integer
      add :level_mxm, :integer
      add :level_inf, :integer
      add :level_grv, :integer
      add :level_hvn, :integer
      add :level_vvd, :integer

      timestamps()
    end
  end
end
