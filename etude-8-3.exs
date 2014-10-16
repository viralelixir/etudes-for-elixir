defmodule Stats do

    def mean list do
        List.foldl(list, 0, fn (x, acc) -> x + acc end) / Enum.count list
    end

    def stdv list do
        {sum, sum_of_squares} = List.foldl(list, {0, 0}, fn (x, {a1, a2}) -> {x + a1, x * x + a2} end)
        :math.sqrt(
            (Enum.count(list) * sum_of_squares - :math.pow(sum, 2)) / (Enum.count(list) * (Enum.count(list) - 1))
        )
    end
end
