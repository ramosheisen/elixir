defmodule CursoElixir do
  @personas [%{firstname: "Carlos", lastname: "Lievano"},
            %{firstname: "Andres", lastname: "Ramos"},
            %{firstname: "Camilo", lastname: "Perez"},
            %{firstname: "Laura", lastname: "Riascos"}]

  @numeros [1,2,3,4]

  def buscar([]), do: "No hay mas items"

  def buscar([ head | tail ] = _list \\ @personas) do
    IO.inspect(head, label: "---->")

    %{ firstname: a}  = head
    IO.inspect(a, label: "---->")
    buscar(tail)
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
end
