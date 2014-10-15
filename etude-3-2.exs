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
end

IO.puts Geom.area(:rectangle, -3, 4)

IO.puts Geom.area(:triangle, 3, -4)

IO.puts Geom.area(:ellipse, -3, -4)

IO.puts Geom.area(:rectangle, 3, 4)

IO.puts Geom.area(:triangle, 3, 4)

IO.puts Geom.area(:ellipse, 3, 4)
