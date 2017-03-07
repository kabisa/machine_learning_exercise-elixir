defmodule MachineLearningExercise.Tokenizer do
  def tokenize(text) do
    text
    |> String.downcase
    |> String.replace(~r/(@\S*|http\S*)/, "")
    |> String.split(~r/\W/u)
  end
end
