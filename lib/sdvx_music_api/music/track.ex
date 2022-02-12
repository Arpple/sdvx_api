defmodule SdvxMusicApi.Music.Track do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}

  schema "tracks" do
    field :artist, :string
    field :jacket, :string
    field :level_adv, :integer
    field :level_exh, :integer
    field :level_grv, :integer
    field :level_hvn, :integer
    field :level_inf, :integer
    field :level_mxm, :integer
    field :level_nov, :integer
    field :level_vvd, :integer
    field :title, :string

    timestamps()
  end

  @changeset_attrs [
    :id, :title, :artist, :jacket,
    :level_nov, :level_adv, :level_exh, :level_mxm,
    :level_inf, :level_grv, :level_hvn, :level_vvd,
  ]

  def changeset(track, attrs) do
    track
    |> cast(attrs, @changeset_attrs)
    |> validate_required([:id, :title, :artist, :jacket])
  end
end
