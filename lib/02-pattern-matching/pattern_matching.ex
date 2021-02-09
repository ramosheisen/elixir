IO.puts "Hola mundo"
[a | b] = mylist = [1, 2, 3]
#IO.puts mylist
IO.inspect(mylist, label: "->")
IO.inspect(a, label: "->")
IO.inspect(b, label: "->")

IO.inspect(b, label: "->")

[ %{ firstname: a } | b ] = personas = [%{firstname: "Carlos", lastname: "Lievano"},
            %{firstname: "Andres", lastname: "Ramos"},
            %{firstname: "Camilo", lastname: "Perez"},
            %{firstname: "Laura", lastname: "Riascos"}]

IO.inspect(a, label: "----->")
