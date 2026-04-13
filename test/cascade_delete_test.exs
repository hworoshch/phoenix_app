defmodule PhoenixApp.CascadeDeleteTest do
  use PhoenixApp.DataCase
  alias PhoenixApp.User
  alias PhoenixApp.Post

  test "связь в users_posts удаляется вместе с юзером" do
    user = Repo.insert!(%User{name: "New User", email: "user@mail.com", bio: "something"})
    post = Repo.insert!(%Post{title: "New Post", content: "something else"})

    Repo.insert_all("users_posts", [[user_id: user.id, post_id: post.id]])
    assert Repo.one(from p in "users_posts", select: count()) == 1

    Repo.delete!(user)
    assert Repo.one(from p in "users_posts", select: count()) == 0

    assert Repo.get(Post, post.id)
  end
end
