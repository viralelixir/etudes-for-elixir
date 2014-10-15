defmodule Geom do
	def area(shape, dim1, dim2) when dim1 >= 0 and dim2 >= 0 do
		case shape do
			:rectangle -> dim1 * dim2
			:triangle  -> dim1 * dim2 / 2
			:ellipse   -> :math.pi() * dim1 * dim2
		end
	end
end

IO.puts Geom.area(:rectangle, -3, 4)

IO.puts Geom.area(:triangle, 3, -4)

IO.puts Geom.area(:ellipse, -3, -4)

IO.puts Geom.area(:rectangle, 3, 4)

IO.puts Geom.area(:triangle, 3, 4)

IO.puts Geom.area(:ellipse, 3, 4)
