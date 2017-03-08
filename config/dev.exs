use Mix.Config

# Print only warnings and errors during test
config :logger, level: :debug

# Configure the dev database
config :machine_learning_exercise, MachineLearningExercise.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "machine_learning_exercise_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
