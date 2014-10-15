defmodule Geom do
    def area(height \\ 1, width \\ 1) do
        height * width
    end
end

IO.puts Geom.area(7, 5)

IO.puts Geom.area(7)

IO.puts Geom.area()
