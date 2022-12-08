defmodule Hello.Shop.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Shop.Data

  schema "products" do
    field :archived_at, :naive_datetime
    field :name, :string

    embeds_one :data, Data, on_replace: :update

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:archived_at, :name])
    |> validate_required([:archived_at, :name])
  end
end
