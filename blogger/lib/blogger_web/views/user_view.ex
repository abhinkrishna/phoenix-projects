defmodule BloggerWeb.UserView do
  use BloggerWeb, :view

  def render("create_user.json", %{user: user}) do
    %{
      status: "success",
      body: render("user.json", user: user)
    }
  end


  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      age: user.age,
      posts: render_many(user.posts, BloggerWeb.PostView, "post.json", as: :post),
      created_at: user.inserted_at,
      updated_at: user.updated_at,
    }
  end


  def render("all_users.json", %{users: users}) do
    render_many(users, BloggerWeb.UserView, "user.json", as: :user)
  end


  def render("message.json", %{message: message}), do: %{message: message}


end
