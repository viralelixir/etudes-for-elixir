defmodule NonFP do

    def generate_pockets(list, p) do
        :random.seed(:erlang.now())
        generate_pockets(list, p, [])
    end

    defp generate_pockets([], _, acc) do
        Enum.reverse acc
    end

    defp generate_pockets([head | tail], p, acc) do
        case head do
            "T" -> generate_pockets(tail, p, [generate_tooth(p)|acc])
            "F" -> generate_pockets(tail, p, [[0]|acc])
        end
    end

    defp generate_tooth(p) do
        generate_tooth(random_base_depth(p), 6, [])
    end

    defp generate_tooth(base_depth, no_items, acc) do
        case no_items do
            0 -> acc
            _ -> generate_tooth(base_depth, no_items - 1, acc ++ [base_depth + random_sign])
        end
    end

    defp random_sign do
        if (:random.uniform() < 0.5) do
            -1
        else
            1
        end
    end

    defp random_base_depth p do
        if (:random.uniform() < p) do
            2
        else
            3
        end
    end

end

NonFP.generate_pockets(
    [
        "T",
        "T",
        "T",
        "T",
        "F",
        "F",
        "T",
        "T",

        "T",
        "T",
        "T",
        "T",
        "F",
        "F",
        "T",
        "T",

        "T",
        "T",
        "T",
        "T",
        "F",
        "F",
        "T",
        "T",

        "T",
        "T",
        "T",
        "T",
        "F",
        "F",
        "T",
        "T"
    ],
    0.7
)
