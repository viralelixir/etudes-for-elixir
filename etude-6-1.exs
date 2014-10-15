defmodule Stats do

    def minimum [] do
        :error
    end

    def minimum [head | tail] do
        comp [head | tail], head, fn (head, min) -> if head < min do head else min end end
    end

    def maximum [] do
        :error
    end

    def maximum [head | tail] do
        comp [head | tail], head, fn (head, max) -> if head > max do head else max end end
    end

    def range [] do
        :error
    end

    def range list do
        [minimum(list), maximum(list)]
    end

    defp comp [head | tail], value, func do
        nmin = func.(head, value)

        case tail do
            [] -> nmin
            _  -> comp tail, nmin, func
        end
    end
end

IO.puts Stats.minimum [1, 5]
IO.puts Stats.maximum [1, 5]

IO.puts Stats.minimum [5]
IO.puts Stats.maximum [5]

IO.puts Stats.minimum [1, 2, 3, 4, 5]
IO.puts Stats.maximum [1, 2, 3, 4, 5]

IO.puts Stats.minimum [5, 4, 3, 2, 1]
IO.puts Stats.maximum [5, 4, 3, 2, 1]

IO.puts Stats.minimum [4, 1, -2, 7, 3]
IO.puts Stats.maximum [4, 1, -2, 7, 3]
