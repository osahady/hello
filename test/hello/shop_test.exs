defmodule Hello.ShopTest do
  use Hello.DataCase

  alias Hello.Shop

  describe "products" do
    alias Hello.Shop.Product

    import Hello.ShopFixtures

    @invalid_attrs %{archived_at: nil, name: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Shop.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Shop.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{archived_at: ~N[2022-12-07 05:39:00], name: "some name"}

      assert {:ok, %Product{} = product} = Shop.create_product(valid_attrs)
      assert product.archived_at == ~N[2022-12-07 05:39:00]
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{archived_at: ~N[2022-12-08 05:39:00], name: "some updated name"}

      assert {:ok, %Product{} = product} = Shop.update_product(product, update_attrs)
      assert product.archived_at == ~N[2022-12-08 05:39:00]
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_product(product, @invalid_attrs)
      assert product == Shop.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Shop.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Shop.change_product(product)
    end

    test "create_product/1 and update with embeded data" do
      valid_attrs = Map.put(@valid_attrs, :data, %{size: "L", color: "green"})

      assert {:ok, %Product{} = product} = Shop.create_product(valid_attrs)
      assert product.data.size == "L"
      assert product.data.color == "green"

      update_attrs = Map.put(@valid_attrs, :data, %{size: "M", color: "red"})
      assert {:ok, %Product{} = product} = Shop.update_product(product, update_attrs)
      assert product.data.size == "M"
      assert product.data.color == "red"
    end
  end
end
