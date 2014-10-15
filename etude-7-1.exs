defmodule College do

    def make_room_list(filename) do
        {:ok, device} = File.open(filename, [:read, :utf8])
        result = read device, HashDict.new
        File.close(device)
        result
    end


    defp read(device, dict) do
        line = IO.read(device, :line)

        case line do
            :eof -> dict
            _ -> read(device, add(dict, line))
        end
    end

    defp add dict, line do
        [_, name, room] = String.split(String.strip(line), ~r/,/)
        if (Dict.has_key?(dict, room)) do
            Dict.put(
                dict,
                room,
                Dict.get(dict, room) ++ [name]
            )
        else
            Dict.put(
                dict,
                room,
                [name]
            )
        end
    end
end
