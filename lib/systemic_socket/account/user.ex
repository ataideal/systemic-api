defmodule SystemicSocket.Account.User do
  use Ecto.Schema
  import Ecto.Changeset



  schema "users" do
    field :cpf, :string
    field :email, :string
    field :name, :string
    field :password, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :role, :cpf])
    |> validate_required([:name, :email, :password, :role, :cpf])
  end
end
