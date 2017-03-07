defmodule MachineLearningExercise.Unigram do
  import Ecto.Changeset
  import Ecto.Query

  use Ecto.Schema

  schema "unigrams" do
    field :word, :string
    field :klass, :string
    field :count, :integer
  end

  def by_klass(query, klass) do
    from u in query,
    where: u.klass == ^klass
  end

  def by_word(query, word) do
    from u in query,
    where: u.word == ^word
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:word, :klass, :count])
    |> validate_required([:word, :klass, :count])
  end
end
