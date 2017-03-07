defmodule Mix.Tasks.MachineLearningExercise.ExtractUnigrams do
  @shortdoc "Extract unigrams from tweets"

  alias MachineLearningExercise.{Repo, Tokenizer, Tweet, Unigram}

  import Ecto.Query
  import Mix.Ecto

  use Mix.Task

  def run(_) do
    ensure_started(Repo, [])
    Repo.delete_all(Unigram)
    extract_and_insert("negative")
    extract_and_insert("positive")
  end

  defp extract_and_insert(klass) do
    from(t in Tweet, where: t.klass == ^klass)
    |> Repo.all()
    |> Enum.map(&(&1.text))
    |> Enum.flat_map(&Tokenizer.tokenize/1)
    |> Enum.group_by(&(&1))
    |> Enum.map(fn {word, words} ->
      %Unigram{}
      |> Unigram.changeset(%{word: word, klass: klass, count: length(words)})
      |> Repo.insert()
    end)
  end
end
