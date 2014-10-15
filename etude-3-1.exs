defmodule Geom do
    def area(:rectangle, height, width) do
        height * width
    end

    def area(:triangle, base, height) do
        base * height / 2
    end

    def area(:ellipse, major, minor) do
        :math.pi() * major * minor
    end
end

IO.puts Geom.area(:rectangle, 3, 4)

IO.puts Geom.area(:triangle, 3, 5)

IO.puts Geom.area(:ellipse, 2, 4)