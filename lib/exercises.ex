defmodule Exercises do

  def exercise_1(i \\ 0, n, v \\ 1) when i < n do
    IO.puts "#{v}"
    exercise_1(i + 1, n, v)
  end
  def exercise_1(_, _, _), do: :ok

  def exercise_2([], result), do: {:ok, "El resultado es: #{result}"}
  def exercise_2([head | tail], result \\ 0) do
    cond do
      is_number(head) -> exercise_2(tail, head + result)
      true -> {:error, "Parametros de entrada incorrecto: #{head}"}
    end
  end

  def exercise_3(list) do
    cond do
      is_list(list) -> exercise_33(list, [])
      true -> {:error, "Parametros de entrada incorrecto: #{list}"}
    end
  end

  defp exercise_33([], invertedList), do: IO.inspect(invertedList, label: "El resultado es", limit: :infinity)
  defp exercise_33([head | tail], invertedList) do
    exercise_33(tail, [head | invertedList])
  end

  def exercise_4(list) do
    cond do
      is_list(list) == false -> {:error, false}
      list == exercise_44(list) -> {:ok, true}
      list == Enum.sort(list) -> {:ok, true}
      true -> {:ok, false}
    end
  end

  def exercise_44([]), do: []
  def exercise_44([head | []]), do: [head]
  def exercise_44([head | tail]) do
    min = Enum.filter(tail, fn(n) -> n < head  end)
    max = Enum.filter(tail, fn(n) -> n > head  end)

    exercise_44(min) ++  [head] ++ exercise_44(max)
  end

end
