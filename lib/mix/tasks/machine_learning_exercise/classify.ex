defmodule Mix.Tasks.MachineLearningExercise.Classify do
  @shortdoc "Classify a tweet"

  alias MachineLearningExercise.{Classifier, Repo}

  import Mix.Ecto

  use Mix.Task

  def run([text]) do
    ensure_started(Repo, [])
    classify(text)
    |> IO.inspect
  end

  defp classify(text) do
    case Classifier.classify(text) do
      {positive_probability, negative_probability} when positive_probability >= negative_probability ->
        {"positive", positive_probability, negative_probability}
      {positive_probability, negative_probability} ->
        {"negative", positive_probability, negative_probability}
    end
  end
end
