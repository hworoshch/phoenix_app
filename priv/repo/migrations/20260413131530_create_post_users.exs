defmodule PhoenixApp.Repo.Migrations.CreateUsersPosts do
  use Ecto.Migration

  def change do
    create table(:users_posts, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :post_id, references(:posts, on_delete: :delete_all)
    end

    create index(:users_posts, [:user_id])
    create index(:users_posts, [:post_id])

    create unique_index(:users_posts, [:user_id, :post_id])
  end
end
