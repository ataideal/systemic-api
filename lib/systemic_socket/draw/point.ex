defmodule SystemicSocket.Draw.Point do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id,:c,:isDummy,:x,:y,:r]}

  schema "points" do
    field :c, :string
    field :isDummy, :boolean, default: false
    field :r, :integer
    field :x, :integer
    field :y, :integer

    timestamps()
  end

  @doc false
  def changeset(point, attrs) do
    point
    |> cast(attrs, [:c, :isDummy, :r, :x, :y])
    |> validate_required([:c, :isDummy, :r, :x, :y])
  end
end
