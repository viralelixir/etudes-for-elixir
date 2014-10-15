defmodule Dijkstra do
    def gcd m, n do
        cond do
            m == n -> m
            m > n  -> gcd(m - n, n)
            m < n  -> gcd(m, n - m)
        end
    end
end

IO.puts Dijkstra.gcd(2, 8)

IO.puts Dijkstra.gcd(14, 21)

IO.puts Dijkstra.gcd(125, 46)

IO.puts Dijkstra.gcd(120, 36)
