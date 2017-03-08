defmodule MachineLearningExercise.TokenizerTest do
  alias MachineLearningExercise.Tokenizer

  use ExUnit.Case, async: true

  test "downcases tokens" do
    tokens = Tokenizer.tokenize("LOOK AT ME!")
    assert tokens == ["look", "at", "me"]
  end

  test "does not tokenize usernames" do
    tokens = Tokenizer.tokenize("@JohnDoe Look at me!")
    assert tokens == ["look", "at", "me"]
  end

  test "does not tokenize urls" do
    tokens = Tokenizer.tokenize("Look at http://t.co/123")
    assert tokens == ["look", "at"]
  end
end
