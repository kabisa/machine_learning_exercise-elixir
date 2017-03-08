defmodule MachineLearningExercise.TweetTest do
  alias MachineLearningExercise.Tweet

  use ExUnit.Case, async: true

  test "changeset with valid attributes" do
    changeset = Tweet.changeset(%Tweet{}, %{text: "Hello world", klass: "negative", correlation_id: "123"})
    assert changeset.valid?
  end

  test "changeset without text" do
    changeset = Tweet.changeset(%Tweet{}, %{klass: "negative", correlation_id: "123"})
    refute changeset.valid?
  end

  test "changeset without klass" do
    changeset = Tweet.changeset(%Tweet{}, %{text: "Hello world", correlation_id: "123"})
    refute changeset.valid?
  end

  test "changeset without correlation id" do
    changeset = Tweet.changeset(%Tweet{}, %{text: "Hello world", klass: "negative"})
    refute changeset.valid?
  end
end
