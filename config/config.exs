# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :machine_learning_exercise, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:machine_learning_exercise, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

config :machine_learning_exercise, ecto_repos: [MachineLearningExercise.Repo]

config :machine_learning_exercise, MachineLearningExercise.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "machine_learning_exercise",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
