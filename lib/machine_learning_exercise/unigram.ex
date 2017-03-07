defmodule MachineLearningExercise.Unigram do
  import Ecto.Changeset

  use Ecto.Schema

  schema "unigrams" do
    field :word, :string
    field :klass, :string
    field :count, :integer
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:word, :klass, :count])
    |> validate_required([:word, :klass, :count])
  end
end
