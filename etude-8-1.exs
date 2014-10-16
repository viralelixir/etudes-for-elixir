defmodule Calculus do

    @delta 1.0e-10

    def derivative(func, x) do
        (func.(x + @delta) - func.(x)) / @delta
    end
end
