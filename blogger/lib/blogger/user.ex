defmodule Blogger.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :age, :integer
    # field :email, :string
    # field :password_hash, :string
    has_many :posts, Blogger.Post, on_delete: :delete_all
    # field :password, :string, virtual: true
    # field :password, :string, virtual: true
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
    # |> validate_format(:email, ~r/@/)
    # |> validate_length(:password, :password_hash, min: 8)
    # |> unique_constraint(:email)
    # |> validate_conformation(:password)
  end

end
