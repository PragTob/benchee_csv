list = Enum.to_list(1..10_000)
map_fun = fn(i) -> [i, i * i] end

Benchee.run(
  %{
    formatters: [&Benchee.Formatters.CSV.output/1],
    csv: %{file: "my.csv"}
  },
  %{
    "flat_map"    => fn -> Enum.flat_map(list, map_fun) end,
    "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten end
  })