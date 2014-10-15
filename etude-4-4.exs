defmodule Powers do
    import Kernel, except: [raise: 2, raise: 3]

    def raise(base, exp) when exp == 0 do
        1
    end

    def raise(base, exp) when exp < 0 do
        1 / raise base, -exp
    end

    def raise(base, exp) when exp > 0 do
        raise base, exp, 1
    end

    defp raise(base, exp, acc) do
        cond do
            exp == 0 -> acc
            true     -> raise base, exp - 1, base * acc
        end
    end

end

IO.puts Powers.raise(5, 1)

IO.puts Powers.raise(2, 3)

IO.puts Powers.raise(1.2, 3)

IO.puts Powers.raise(2, 0)

IO.puts Powers.raise(2, -3)
