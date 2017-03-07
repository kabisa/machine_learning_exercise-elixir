defmodule MachineLearningExercise.Repo.Migrations.CreateUnigrams do
  use Ecto.Migration

  def change do
    create table(:unigrams) do
      add :word, :string, null: false
      add :klass, :string, null: false
      add :count, :integer, null: false
    end

    create unique_index(:unigrams, [:word, :klass])
  end
end
