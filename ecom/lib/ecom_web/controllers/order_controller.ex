defmodule EcomWeb.Orders do
  use EcomWeb, :controller
  require Ecto.Query


  def my_orders(conn, %{"phone" => phone}) do
    # fetch order details from db\
    # with %Ecom.Orders{} = order  <- Ecom.Repo.get_by(Ecom.Orders, phone: phone)
    with %Ecom.Orders{} = orders  <- Ecom.Repo.all(Ecom.Orders)
    do   # edited!
      conn
      |> put_status(200)
      |> render("all_orders.json", orders: orders)
    else
      _ -> conn
          |> put_status(404)
          |> render("empty.json")
    end
  end



  def get_all_order(conn, _) do
    # fetch all Orders
    orders = Ecom.Repo.all(Ecom.Orders)
    conn
    |> put_status(200)
    |> render("all_orders.json", orders: orders)
  end



  def new_order(conn, order) do
    %Ecom.Orders{
      address: order["address"],
      phone: order["phone"],
      count: order["count"]
    }
    |> Ecom.Repo.insert
    # add data to db
    conn
    |> put_status(201)
    |> render("new.json", order: order)
  end



end
