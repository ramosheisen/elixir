use Mix.Config

config :logger, level: :debug

config :curso_elixir, CursoElixir.Scheduler,
  #storage: QuantumStoragePersistentEts,
  jobs: [
    example_1: [
      schedule: {:extended, "*/2"},
      task: {Example1, :exercise_1, []}
    ],
    example_2: [
      # 0/2 * * * *
      schedule: "*/2 * * * *",
      task: fn -> File.write("tmp/task.txt", "Hi, world", [:append]) end
    ]
  ]
