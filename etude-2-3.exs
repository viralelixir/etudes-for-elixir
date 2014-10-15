defmodule Geom do
    @moduledoc """
    Functions for calculating areas of geometric shapes.
    """

    @doc """
    Returns the total area of the rectangle, given the height and width.
    """

    @spec area(number(), number()) :: number()

    def area(height \\ 1, width \\ 1) do
        height * width
    end
end

IO.puts Geom.area(7, 5)

IO.puts Geom.area(7)

IO.puts Geom.area()
