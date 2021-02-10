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
  def fibonacci(n) do fibonacci(n-1) + fibonacci(n-2) end
end
