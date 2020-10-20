defmodule BloggerWeb.PostView do
  use BloggerWeb, :view


  def render("post.json", %{post: post}) do
    %{
      "id": post.id,
      "title": post.title,
      "body": post.body,
      "user_id": post.user_id,
      "created_at": post.inserted_at,
      "updated_at": post.updated_at
    }
  end


  def render("posts.json", %{posts: posts}) do
    render_many(posts, BloggerWeb.PostView, "post.json", as: :post)
  end


  def render("message.json", %{message: message}) do
    %{ message: message }
  end


end
