defmodule Geom do
    def area(:rectangle, height, width) when height >= 0 and width >= 0 do
        height * width
    end

    def area(:triangle, base, height) when base >= 0 and height >= 0 do
        base * height / 2
    end

    def area(:ellipse, major, minor) when major >= 0 and minor >= 0  do
        :math.pi() * major * minor
    end

    def area(_, _, _) do
        0
    end
end

IO.puts Geom.area(:rectangle, 3, 4)

IO.puts Geom.area(:pentagon, 3, 4)

IO.puts Geom.area(:ellipse, -1, 5)

IO.puts Geom.area(:triangle, 5, -1)
