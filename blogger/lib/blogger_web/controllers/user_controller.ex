defmodule BloggerWeb.UserController do
  use BloggerWeb, :controller
  alias Blogger.User


  def all_users(conn, params) do
    users = Blogger.Repo.all(Blogger.User) |> Blogger.Repo.preload(:posts)
    conn
    |> put_status(200)
    |> render("all_users.json", users: users)
  end


  def create(conn, params) do

    changeset = User.changeset(%Blogger.User{}, params)
    case Blogger.Repo.insert(changeset) do
      {:ok, user} -> conn |> put_status(201) |> render("create_user.json", user: user)
      {:error, changeset} -> conn |> put_status(400) |> render("message.json", message: "Failed")
    end

    # {:ok, user} = User.changeset(%Blogger.User{}, params)
    # |> Blogger.Repo.insert
    # conn
    # |> put_status(201)
    # |> render("create_user.json", user: user)

  end


  def update(conn, params) do
    user = Blogger.Repo.get!(Blogger.User, params["id"])
    user = Ecto.Changeset.change(user, age: params["age"], name: params["name"])
    case Blogger.Repo.update user do
      {:ok, _}     -> conn |> put_status(200) |> render("message.json", message: "Update success")
      {:error, _}  -> conn |> put_status(305) |> render("message.json", message: "Update failed")
    end
    conn
    |> render("user.json", user: user)
    # user = Ecto.Changeset.change
  end


  def delete(conn, params) do
    with %Blogger.User{} = user <- Blogger.Repo.get!(Blogger.User, params["id"]),
        {:ok, _}  <-  Blogger.Repo.delete user
        # impliment post deletes
    do
        conn
        |> put_status(200)
        |> render("message.json", message: "Delete success")
    else
      _ -> conn
      |> put_status(406)
      |> render("message.json", message: "Delete failed")
    end
  end


  # def deleteUser(conn, params) do
  #   user = Blogger.Repo.get!(Blogger.User, params["id"])
  #   case Blogger.Repo.delete user do
  #     {:ok, _ } -> conn |> render("message.json", message: "Delete success")
  #     {_, _} -> conn |> render("message.json", message: "Delete failed")
  #   end
  # end

end
