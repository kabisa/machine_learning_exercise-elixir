defmodule MachineLearningExercise.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :text, :string, null: false
      add :klass, :string, null: false
      add :correlation_id, :string, null: false
    end

    create unique_index :tweets, :correlation_id
  end
end
