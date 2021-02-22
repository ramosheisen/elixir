defmodule KV do

  # {:ok, pid_1} = KV.start_link
  # send pid_1, {:get, :hello, self()}
  # send pid_1, {:put, :hello, :world}
  # flush()

  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  def loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end

  # KV.character(1)
  def character(param) do
    service = HTTPoison.get("https://rickandmortyapi.com/api/character/#{param}")
    case service do
      {:ok, %HTTPoison.Response{ status_code: 200, body: body }} ->
        {:ok, %{ "created" => created }} = Poison.decode(body)
        IO.puts created
      {:ok, %HTTPoison.Response{ status_code: 404 }} ->
        IO.puts "No se encuentra la url"
      {:error, %HTTPoison.Error{ reason: reason }} ->
        IO.inspect(reason, label: "--------------->")
    end
  end

  def location(param) do
    service = HTTPoison.get("https://rickandmortyapi.com/api/location/#{param}")
    case service do
      {:ok, %HTTPoison.Response{ status_code: 200, body: body }} ->
        {IO.inspect(body, label: "--------------->")}
      {:ok, %HTTPoison.Response{ status_code: 404 }} ->
        IO.puts "No se encuentra la url"
      {:error, %HTTPoison.Error{ reason: reason }} ->
        IO.inspect(reason, label: "--------------->")
    end
  end

  def episode(param) do
    service = HTTPoison.get("https://rickandmortyapi.com/api/episode/#{param}")
    case service do
      {:ok, %HTTPoison.Response{ status_code: 200, body: body }} ->
        IO.inspect(body, label: "--------------->")
      {:ok, %HTTPoison.Response{ status_code: 404 }} ->
        IO.puts "No se encuentra la url"
      {:error, %HTTPoison.Error{ reason: reason }} ->
        IO.inspect(reason, label: "--------------->")
    end
  end

end
