defmodule MachineLearningExercise.ClassifierTest do
  alias MachineLearningExercise.{Classifier, Repo, Tweet, Unigram}

  use ExUnit.Case, async: false

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(MachineLearningExercise.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(MachineLearningExercise.Repo, {:shared, self()})
    insert_tweets()
    insert_unigrams()
    :ok
  end

  describe "when text carries positive sentiment" do
    test "has higher positive probability" do
      {positive_probability, negative_probability} = Classifier.classify("I am happy!")
      assert positive_probability > negative_probability
    end
  end

  describe "when text carries negative sentiment" do
    test "has higher negative probability" do
      {positive_probability, negative_probability} = Classifier.classify("I am sad!")
      assert positive_probability < negative_probability
    end
  end

  defp insert_tweets do
    Repo.insert %Tweet{text: "Happy! :)", klass: "positive", correlation_id: "42"}
    Repo.insert %Tweet{text: "I am happy :)", klass: "positive", correlation_id: "43"}
    Repo.insert %Tweet{text: "I am sad! :(", klass: "negative", correlation_id: "44"}
    Repo.insert %Tweet{text: "Sad! :(", klass: "negative", correlation_id: "45"}
  end

  defp insert_unigrams do
    Repo.insert %Unigram{word: "i", klass: "positive", count: 1}
    Repo.insert %Unigram{word: "am", klass: "positive", count: 1}
    Repo.insert %Unigram{word: "happy", klass: "positive", count: 2}
    Repo.insert %Unigram{word: "i", klass: "negative", count: 1}
    Repo.insert %Unigram{word: "am", klass: "negative", count: 1}
    Repo.insert %Unigram{word: "sad", klass: "negative", count: 2}
  end
end
