defmodule Ecom.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :address, :string
      add :phone, :string
      add :count, :integer

      timestamps()
    end

  end
end
