defmodule Country do
    defstruct [:name, :language, :cities]
end

defmodule City do
    defstruct [:name, :population, :latitude, :longitude]
end

defmodule Geography do
    def make_geo_list filename do
        {:ok, device} = File.open(filename, [:read, :utf8])
        result = parse_countries(device, IO.read(device, :line), [])
        File.close(device)
        result
    end

    defp parse_countries(device, line, countries) do
        line = if line == :none do IO.read(device, :line) else line end
        case line do
            :eof -> countries
            _    -> [name, language] = parse_line(line)
                    {next_line, cities} = parse_cities(device, [])
                    parse_countries(device, next_line, add_country(countries, name, language, cities))
        end
    end

    defp parse_cities(device, cities) do
        line = IO.read(device, :line)
        case line do
            :eof -> {:none, cities}
            _ -> case parse_line(line) do
                    [name, population, latitude, longitude] -> parse_cities(device, add_city(cities, name, population, latitude, longitude))
                    _ -> {line, cities}
                 end
        end
    end

    defp parse_line(line) do
        String.split(String.strip(line), ~r/,/)
    end

    defp add_country(countries, name, language, cities) do
        [
            %Country{
                name:       name,
                language:   language,
                cities:     cities
            }
            |
            countries
        ]
    end

    defp add_city(cities, name, population, latitude, longitude) do
        [
            %City{
                name:       name,
                population: population,
                latitude:   latitude,
                longitude:  longitude
            }
            |
            cities
        ]
    end

    def total_population(glist, aLanguage) when is_list(glist) and is_binary(aLanguage) do
        find_total_population(
            Enum.filter(glist, fn %Country{language: language} -> language == aLanguage end),
            0
        )
    end

    defp find_total_population([%Country{cities: cities}|tail], acc) when is_integer(acc) do
        find_total_population(tail, acc + count_population_of_country(cities, 0))
    end

    defp find_total_population([], acc) do
        acc
    end

    defp count_population_of_country([%City{population: population}|tail], acc) do
        count_population_of_country(tail, acc + String.to_integer(population))
    end

    defp count_population_of_country([], acc) do
        acc
    end

end
