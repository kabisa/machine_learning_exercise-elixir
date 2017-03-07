defmodule MachineLearningExercise.Classifier do
  alias MachineLearningExercise.{Repo, Tokenizer, Tweet, Unigram}

  import Ecto.Query

  def classify(text) do
    {probability(text, "positive"), probability(text, "negative")}
  end

  defp prior_probability(klass) do
    (Tweet |> Tweet.by_klass(klass) |> Repo.aggregate(:count, :id)) / Repo.aggregate(Tweet, :count, :id)
  end

  defp conditional_probability(word, klass) do
    occurrences_of_word_in_klass = occurrences_of_word_in_klass(word, klass)
    vocabulary_size = distinct_word_count() + (Unigram |> Unigram.by_klass(klass) |> Repo.aggregate(:sum, :count))
    occurrences_of_word_in_klass / vocabulary_size
  end

  defp probability(text, klass) do
    text
    |> Tokenizer.tokenize
    |> Enum.map(&(conditional_probability(&1, klass)))
    |> Enum.reduce(fn (conditional_probability, accumulator) -> conditional_probability * accumulator end)
    |> Kernel.*(prior_probability(klass))
  end

  defp occurrences_of_word_in_klass(word, klass) do
    case Unigram |> Unigram.by_klass(klass) |> Unigram.by_word(word) |> Repo.one do
      nil -> 1
      unigram -> unigram.count
    end
  end

  defp distinct_word_count do
    from(u in Unigram, distinct: :word)
    |> Repo.aggregate(:count, :word)
  end
end
