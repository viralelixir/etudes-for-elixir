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


defprotocol Valid do
    @doc "Returns true if data is considered valid"
    def valid?(data)
end


defimpl Valid, for: City do
    def valid?(%City{population: population, latitude: latitude, longitude: longitude}) do
        population >= 0 && -90 <= latitude && latitude <= 90 && -180 <= longitude && longitude <= 180
    end
end


defimpl Inspect, for: City do
    def inspect(%City{name: name, population: population, latitude: latitude, longitude: longitude}, _) do
        str_latitude  = abs(Float.round(1.0 * latitude,  2))
        str_latitude  = inspect(str_latitude)  <> if latitude  < 0 do "°N" else "°S" end
        str_longitude = abs(Float.round(1.0 * longitude, 2))
        str_longitude = inspect(str_longitude) <> if longitude < 0 do "°W" else "°E" end
        """
        #City<
          #{name} (#{population}), #{str_latitude} #{str_longitude}
        >
        """
    end
end
