defmodule CursoElixir do
  @personas [%{firstname: "Carlos", lastname: "Lievano"},
            %{firstname: "Andres", lastname: "Ramos"},
            %{firstname: "Camilo", lastname: "Perez"},
            %{firstname: "Laura", lastname: "Riascos"}]

  @numeros [1,2,3,4]

  def buscar([]), do: "No hay mas items"

  def buscar([ head | tail ] = _list \\ @personas) do
    IO.inspect(head, label: "---->")

    %{ firstname: a, lastname: b}  = head
    IO.puts "Mi primer nombre es #{a}, mi sengundo nombre es #{b}"
    buscar(tail)
  end

  def buscar2 do
    Enum.map(@personas, fn(key) -> "Mi primer nombre es #{key.firstname}, mi sengundo nombre es #{key.lastname}" end)
    #Enum.map(1..10, fn(a) -> a * 1 end)
  end

  def sumar([], suma), do: "La suma es: #{suma}"

  def sumar([head | tail] \\ @numeros, suma \\ 0) do
    result = suma + head
    sumar(tail, result)
  end

  # Anonymous functions
  # Console example: CursoElixir.operaciones([2, 3], 1, fn (a, b) -> a * b end)
  def operaciones([], result, _funcion), do: result

  def operaciones([head | tail] \\ @numeros, operacion \\ 0, funcion) do
    result = funcion.(operacion, head)
    operaciones(tail, result, funcion)
  end

  def buscarnumero([], param), do: "NO encontro el numero #{param}"

  def buscarnumero([ head | tail ] \\ @numeros, param) do
    if head === param do
      IO.puts "SI encontro el numero #{param}"
    else
      buscarnumero(tail, param)
    end
  end

  def contarnumeros([], count), do: "Cantidad de numeros #{count}"

  def contarnumeros([ _head | tail ] \\ @numeros, count \\ 0) do
    nucount = count + 1;
    contarnumeros(tail, nucount)
  end

  def concatenar([], concat), do: {:ok, "Texto: #{concat}"}

  def concatenar([ head | _tail ], _concat) when is_number(head) do
    {:error, "Error, hay un numero en la lista"}
  end

  def concatenar([ head | tail ], concat \\ "") when is_binary(head) do
    concat = concat <> " " <> head
    concatenar(tail, concat)
  end

  def trianguloPascal(1), do: (IO.puts("1"); [1])

  def trianguloPascal(n) do
    #IO.inspect(Enum.map(1..head, fn(a) -> a * 1 end), label: "---------------->", limit: :infinity)
    #IO.inspect(Enum.map(1..head, fn(a) -> a * 1 end), label: "---------------->")

    list = trianguloPascal(n - 1)
    newList = [1] ++ for(x <- 0..length(list)-1, do: Enum.at(list, x) + Enum.at(list, x+1, 0))
    Enum.join(newList, " ") |> IO.puts
    newList
  end

  def fibonacci(0) do 0 end
  def fibonacci(1) do 1 end
  def fibonacci(n) when is_integer(n) do fibonacci(n-1) + fibonacci(n-2) end

  # f(n) = 1 + 2 + .... + n R\\ 1
  def ff(0, b), do: "resultado: #{b}"

  def ff(n, b) when n > 0 do
    ff(n-1, b + n)
  end

  # For all n > 0 R\\ 2
  def fibo(n) when is_integer(n) do
    cond do
      n > 2 -> fibo(n - 1) + fibo(n - 2)
      n == 1 or n == 2 -> 1
    end
  end

  # Some function R\\ 3
  def someFunction(a, b) do
    cond do
      a == 0 or b == 0 -> 0
      a == b -> someFunction(a - 1, b - 1) + 2 * a - 1
      a > b -> someFunction(a - b, b) + someFunction(b, b)
      a < b -> someFunction(a, a) + someFunction(b - a, a)
    end
  end

  # mcd or gcd (Greatest Common Divisor) R\\ 4
  def gcd(a, b) do
    cond do
      b == 0 -> a
      b > a -> gcd(b, a)
      true -> gcd(a - b, b)
    end
  end

  # Optimice fibonacci
  def fibonacciOpt(n) when is_integer(n) and n > 0, do: fibonacciO(n, 0, 1)
  defp fibonacciO(1, _, b), do: b
  defp fibonacciO(n, a, b), do: fibonacciO(n - 1, b, a + b)

  def forLoop(i, n, v) do
    cond do
      i < n ->
        IO.puts "El valor es #{v}, esta #{i}"
        forLoop(i + 1, n, v)
      true -> "Finalizo"
    end
  end

  def forLoopDos(i, n, v) when i < n do
    IO.puts "El valor es #{v}, esta #{i}"
    forLoopDos(i + 1, n, v)
  end

  def forLoopDos(_, _, _), do: :ok

  def map do
    person = %{doc: 12345, age: 24, city: "Cali"}
    Map.put(person, :sex, "M")
    Map.delete(person, :doc)

    [
      person1: %{doc: 12345, firstname: "Heisen", lastname: "Ramos"},
      person2: %{doc: 67891, firstname: "Andres", lastname: "Perafan"},
    ]

    list = [
      person1: %{doc: 12345, firstname: "Heisen", lastname: "Ramos"},
      person2: %{doc: 12345, firstname: "Andres", lastname: "Perafan"},
    ]

    list[:person1].doc
    List.last(list)
  end



end
