defmodule SystemicSocket.Repo.Migrations.CreatePoints do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :c, :string
      add :isDummy, :boolean, default: false, null: false
      add :r, :integer
      add :x, :integer
      add :y, :integer

      timestamps()
    end

  end
end
