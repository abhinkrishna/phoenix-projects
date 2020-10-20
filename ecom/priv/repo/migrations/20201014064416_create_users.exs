defmodule Ecom.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :address, :string
      add :phone, :string

      timestamps()
    end

  end
end
