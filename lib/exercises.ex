defmodule Exercises do

  def exercise_1(1, v), do: v
  def exercise_1(n, [head | _tail] = list \\ [1]) when n > 1 do
    IO.inspect list
    if head > 0 do
      exercise_1(n - 1, [0 | list])
    else
      exercise_1(n - 1, [1 | list])
    end
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
      is_list(list) == false -> false
      list == exercise44(list) -> true
      true -> false
    end
  end

  def exercise44([]), do: []
  def exercise44([head | []]), do: [head]
  def exercise44([head | tail]) do
    min = Enum.filter(tail, fn(n) -> n < head  end)
    max = Enum.filter(tail, fn(n) -> n > head  end)

    exercise44(min) ++  [head] ++ exercise44(max)
  end

  def exercise_44?([], comparacion, boolean), do: boolean
  def exercise_44?(n, comparacion \\ 0, boolean \\ true) when boolean do
    [head | tail] = n
    exercise_44?(tail, head, head > comparacion)
  end

  def reduction([], newList), do: newList |> Enum.join("")

  def reduction([head | tail], newList) do
    if head in newList do
      reduction(tail, newList)
    else
      list = newList ++ [head]
      reduction(tail, list)
    end
  end

  def reduction([head | _tail], newList) do
    if head in newList do
      reduction([], newList)
    else
      list = newList ++ [head]
      reduction([], list)
    end
  end

  def reduction(param, newList \\ []) when is_binary(param) do
    [head | tail] = String.codepoints(param)

    if head in newList do
      reduction(tail, newList)
    else
      list = newList ++ [head]
      reduction(tail, list)
    end
  end

  def reduction_2([]), do: []

  def reduction_2([head | tail]) do
    [head | for(x <- reduction_2(tail), x != head, do: x)]
  end

  # Example from teacher
  def start do
    str = IO.read(:line)
    remove_dup(str) |> IO.puts
  end

  def remove_dup(str) do
    [h|t] = str |> String.codepoints
    is_dup(h, t, [])
  end

  defp is_dup(h, [], new) do
    unless h in new, do: new = new ++ [h]
    new
  end
  defp is_dup(h, t, new) do
    if h in new do
      is_dup(hd(t), tl(t), new)
    else
      is_dup(hd(t), tl(t), new ++ [h])
    end
  end
  # Example from teacher

  def reduction_3(n)  do
    reductionp(String.codepoints(n))
  end

  defp reductionp([], list),  do: Enum.join(list)

  defp reductionp([head | tail], list \\ [])  do
    result =
      cond do
        head in list -> list
        head not in list -> list ++ [head]
      end

    reductionp(tail, result)
  end

  #Exercises.union(["h","a","c","k","e","r"],["r","a","n","k","e","r"])
  #Exercises.union(["1","2","3","4","5","6","7","8","9"],["a","n","d","r","e","s"])
  #Exercises.union(["1","2","3"],["a","n","d","r","e","s"])
  def union(_, _, list \\ "")
  def union([], [], list), do: IO.inspect(list, label: "----->")

  def union([headA | tailA] = a, [headB | tailB] = b, list) do
    aa = length(a)
    bb = length(b)

    cond do
      aa == bb ->
        list = list <> headA <> headB
        union(tailA, tailB, list)
      aa > bb ->
        [headC | tailC] = add_element(rem(aa, bb) + 1, b)
        list = list <> headA <> headC
        union(tailA, tailC, list)
      aa < bb ->
        [headD | tailD] = add_element(rem(aa, bb) + 1, a)
        list = list <> headD <> headB
        union(tailB, tailD, list)
      true -> "SALIO"
    end
  end

  def add_element(i \\ 1, n, list) when i < n do
    add_element(i + 1, n, list ++ [""])
  end

  # Exercises.compression_string("abbbccddd")
  def compression_string_2(param) do
    param |> String.codepoints() |> Enum.chunk_by(& &1) |> Enum.map_join(fn [arg] -> arg
      [arg | _] = count ->  [arg, length(count) |> to_string()]
    end)
  end

  # Exercises.change_string_position("abcdefgg")
  def change_string_position(param) do
    param |> String.codepoints() |> Enum.chunk_every(2) |> Enum.map_join(fn e -> Enum.reverse(e) end)
  end

  # Exercises.super_digit(9875)
  def super_digit(numbers) do
    numbers = numbers |> Integer.to_string |> String.codepoints() |> do_super_digit
    IO.inspect(numbers, label: "---------------->")
    cond do
      numbers > 9 -> super_digit(numbers)
      true -> numbers
    end
  end

  def do_super_digit(_, count \\ 0)
  def do_super_digit([], count), do: count
  def do_super_digit([h | t], count) do
    do_super_digit(t, count + String.to_integer(h, 10))
  end

  # Exercises.numbers_additional([1,3,5,6,7,9],[1,2,3,4,5,6,7,8,9])
  # lista1 = [1,3,5,6,7,9]
  # lista2 = [1,2,3,4,5,6,7,8,9]
  def numbers_additional(listA, listB) do
    cond do
      length(listA) > length(listB) -> do_numbers_additional(listA, listB)
      length(listA) < length(listB) -> do_numbers_additional(listB, listA)
    end
  end

  defp do_numbers_additional(_, _, list \\ [])
  defp do_numbers_additional([], [], list),  do: list
  defp do_numbers_additional([], _tailB, list),  do: list
  defp do_numbers_additional(_tailA, [], list),  do: list

  defp do_numbers_additional([headA | tailA] = _listA, [headB | tailB] = listB, list) do
    if headA == headB do
      do_numbers_additional(tailA, tailB, list)
    else
      do_numbers_additional(tailA, listB, list ++ [headA])
    end
  end

end
