defmodule Powers do
    import Kernel, except: [raise: 2]

    def raise(base, exp) when exp == 0 do
        1
    end

    def raise(base, exp) when exp == 1 do
        base
    end

    def raise(base, exp) when exp > 0 do
        base * raise base, (exp - 1)
    end

    def raise(base, exp) when exp < 0 do
        1 / raise base, -exp
    end
end

IO.puts Powers.raise(5, 1)

IO.puts Powers.raise(2, 3)

IO.puts Powers.raise(1.2, 3)

IO.puts Powers.raise(2, 0)

IO.puts Powers.raise(2, -3)
