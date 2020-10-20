defmodule EcomWeb.OrdersView do
  use EcomWeb, :view

  def render("my_order.json", %{order: order}) do
    %{
      id: order.id,
      address: order.address,
      phone: order.phone,
    }
  end

  def render("all_orders.json", %{orders: orders}) do
    orders
    |> Enum.map(&render("my_order.json", order: &1))
  end

  def render("new.json", %{order: order}) do
    %{
      status: "success",
      message: "Order created"
    }
  end

  def render("empty.json", _) do
    %{status: "No result found" }
  end

end
