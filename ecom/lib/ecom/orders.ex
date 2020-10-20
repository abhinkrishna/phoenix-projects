defmodule Ecom.Orders do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :address, :string
    field :count, :integer
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(orders, attrs) do
    orders
    |> cast(attrs, [:address, :phone, :count])
    |> validate_required([:address, :phone, :count])
  end
end
