defmodule SystemicSocket.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :role, :string
      add :cpf, :string

      timestamps()
    end

  end
end
