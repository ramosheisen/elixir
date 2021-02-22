defmodule Example1 do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(CursoElixir.Scheduler, [])
    ]

    opts = [strategy: :one_for_one, name: CursoElixir.Supervisor]

    Supervisor.start_link(children, opts)
  end

  def exercise_1(count \\ 0) do
    nucount = count + 1
    IO.puts "Hola #{nucount}"
  end
end
