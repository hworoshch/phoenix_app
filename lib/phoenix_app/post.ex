defmodule PhoenixApp.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :content, :string
    many_to_many :users, PhoenixApp.User, join_through: "users_posts"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs, users \\ []) do
    post
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
    |> put_assoc(:users, users)
  end
end
