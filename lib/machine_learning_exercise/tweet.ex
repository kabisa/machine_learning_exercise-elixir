defmodule MachineLearningExercise.Tweet do
  import Ecto.Changeset
  import Ecto.Query

  use Ecto.Schema

  schema "tweets" do
    field :text, :string
    field :klass, :string
    field :correlation_id, :string
  end

  def by_klass(query, klass) do
    from t in query,
    where: t.klass == ^klass
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :klass, :correlation_id])
    |> validate_required([:text, :klass, :correlation_id])
    |> unique_constraint(:correlation_id)
  end
end
