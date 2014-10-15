defmodule Powers do

    @limit 1.0e-8

    def nth_root(x, n) do
        nth_root(x, n, x / 2.0)
    end

    defp nth_root x, n, a do
        IO.puts("Current guess is #{a}")

        f = :math.pow(a, n) - x
        f_prime = n * :math.pow(a, n - 1)
        next = a - f / f_prime
        change = abs(next - a)
        cond do
            change < @limit -> next
            true -> nth_root(x, n, next)
        end
    end
end

IO.puts Powers.nth_root(27, 3)
