defmodule Blogger.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to  :user, Blogger.User
    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
    |> foreign_key_constraint(:user_id)
  end

end
