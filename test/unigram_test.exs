defmodule MachineLearningExercise.UnigramTest do
  alias MachineLearningExercise.Unigram

  use ExUnit.Case, async: true

  test "changeset with valid attributes" do
    changeset = Unigram.changeset(%Unigram{}, %{word: "world", klass: "negative", count: "1"})
    assert changeset.valid?
  end

  test "changeset without word" do
    changeset = Unigram.changeset(%Unigram{}, %{klass: "negative", count: "1"})
    refute changeset.valid?
  end

  test "changeset without klass" do
    changeset = Unigram.changeset(%Unigram{}, %{word: "world", count: "1"})
    refute changeset.valid?
  end

  test "changeset without count" do
    changeset = Unigram.changeset(%Unigram{}, %{word: "world", klass: "negative"})
    refute changeset.valid?
  end
end
