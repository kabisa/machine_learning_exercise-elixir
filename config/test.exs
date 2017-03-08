use Mix.Config

# Print only warnings and errors during test
config :logger, level: :warn

# Configure the test database
config :machine_learning_exercise, MachineLearningExercise.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "machine_learning_exercise_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
