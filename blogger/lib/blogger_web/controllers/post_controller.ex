defmodule BloggerWeb.PostController do
  use BloggerWeb, :controller
  import Ecto.Query

  def all_posts(conn, _) do
    posts = Blogger.Repo.all(Blogger.Post)
    conn
    |> put_status(200)
    |> render("posts.json", posts: posts)
  end


  def create(conn, params) do
    changeset = Blogger.Post.changeset(%Blogger.Post{}, params)
    case Blogger.Repo.insert(changeset) do
      {:ok, post} -> conn |> put_status(201) |> render("post.json", post: post)
      {:error, changeset} -> conn |> put_status(400) |> render("message.json", message: "Failed")
    end
  end


  def posts_by_user(conn, params) do
    query = Ecto.Query.from post in Blogger.Post, where: post.user_id == ^params["id"], select: post
    posts = Blogger.Repo.all(query)
    conn
    |> put_status(200)
    |> render("posts.json", posts: posts)
  end


  def delete(conn, params) do
    with %Blogger.Post{} = post <- Blogger.Repo.get!(Blogger.Post, params["id"]),
        {:ok, _}  <-  Blogger.Repo.delete post
    do
        conn |> put_status(200) |> render("message.json", message: "Delete success")
    else
      _ -> conn |> put_status(406) |> render("message.json", message: "Delete failed")
    end
  end


end
