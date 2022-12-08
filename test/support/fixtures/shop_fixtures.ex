defmodule Hello.ShopFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello.Shop` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        archived_at: ~N[2022-12-07 05:39:00],
        name: "some name"
      })
      |> Hello.Shop.create_product()

    product
  end
end
