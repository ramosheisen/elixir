# Funciona
a = rem(35, 4) #3

result =
  case a do
    0 -> "35 = 0 mod 4"
    1 -> "35 = 1 mod 4"
    2 -> "35 = 2 mod 4"
    3 -> "35 = 3 mod 4"
  end

IO.puts("result (as function): #{result}")



result = "No value"
IO.puts("result 1: #{result}")
result = "Another Value"
IO.puts("result 2: #{result}")

case a do
  0 -> result = "35 = 0 mod 4"
  1 -> result = "35 = 1 mod 4"
  2 -> result = "35 = 2 mod 4"
  3 -> result = "35 = 3 mod 4"
end

IO.puts("result (as value): #{result}")
