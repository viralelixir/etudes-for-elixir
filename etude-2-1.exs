defmodule Geom do
    def area(height, width) do
        height * width
    end
end

IO.puts Geom.area(3, 4)

IO.puts Geom.area(12, 7)
