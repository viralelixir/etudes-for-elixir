defmodule Cards do
    @moduledoc """
    Functions for simulating a deck of cards.
    """
    @vsn 0.1


    @doc """
    Shuffles a list of cards by using a random generator.
    """
    def shuffle(list) do
        :random.seed(:erlang.now())
        shuffle(list, [])
    end

    @doc """
    An empty list is already shuffled and returns the accumulator.
    """
    defp shuffle([], acc) do
        acc
    end

    @doc """
    Splits the list into two random partitions and moves the head of second
    partition to the shuffled list. Repeat until original list is empty and
    shuffled list contains all elements.
    """
    defp shuffle(list, acc) do
        {leading, [h | t]} = Enum.split(list, :random.uniform(Enum.count(list)) - 1)
        shuffle(leading ++ t, [h | acc])
    end
end
