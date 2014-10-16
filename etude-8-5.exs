defmodule Cards do

    def make_deck do
        for s <- symbols, c <- colors do {s, c} end
    end

    defp symbols do
        ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
    end

    defp colors do
        ["Clubs", "Diamonds", "Hearts", "Spades"]
    end

end
