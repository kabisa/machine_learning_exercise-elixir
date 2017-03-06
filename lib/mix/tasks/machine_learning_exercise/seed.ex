defmodule Mix.Tasks.MachineLearningExercise.Seed do
  @shortdoc "Seed the database with texts"

  alias MachineLearningExercise.{Repo, Tweet}

  import Mix.Ecto

  use Mix.Task

  def run(_) do
    ensure_started(Repo, [])
    search_and_insert(":( -filter:links -rt", "negative")
    search_and_insert(":) -filter:links -rt", "positive")
  end

  defp search_and_insert(query, klass) do
    ExTwitter.search(query, [count: 100, lang: "en"])
    |> Enum.map(fn (tweet) ->
      Tweet.changeset(%Tweet{}, %{text: tweet.text, klass: klass, correlation_id: to_string(tweet.id)})
      |> Repo.insert()
    end)
  end
end
