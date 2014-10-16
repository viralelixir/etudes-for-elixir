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
end
