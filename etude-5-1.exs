defmodule AskArea do
	def area do
		user_input = String.first(IO.gets "R)ectangle, T)riangle, or E)llipse: ")
		shape_input = String.upcase(user_input)
		atom = char_to_shape(shape_input)
		case atom do
			:rectangle -> {dim1, dim2} = get_dimensions("width", "height")
			:triangle  -> {dim1, dim2} = get_dimensions("base", "height")
			:ellipse   -> {dim1, dim2} = get_dimensions("major radius", "minor radius")
			:unknown   -> IO.puts "Unknown shape #{user_input}"
		end
		calculate(atom, dim1, dim2)
	end

	defp char_to_shape(char) do
		case char do
			"R" -> :rectangle
			"T" -> :triangle
			"E" -> :ellipse
			_	-> :unknown
		end
	end

	defp get_number(prompt) do
		user_input = IO.gets "Enter #{prompt} > "
		String.to_integer(String.strip(user_input))
	end

	defp get_dimensions(prompt1, prompt2) do
		{get_number(prompt1), get_number(prompt2)}
	end

	defp calculate(atom, dim1, dim2) 
	when atom == :unknown or not is_number(dim1) or dim1 < 0 or not is_number(dim2) or dim2 < 0 do
		IO.puts "Both numbers must be greater than or equal to zero."
	end

	def calculate(atom, dim1, dim2) do
		Geom.area(atom, dim1, dim2)
	end
end


defmodule Geom do
	def area(shape, dim1, dim2) when dim1 >= 0 and dim2 >= 0 do
		case shape do
			:rectangle -> dim1 * dim2
			:triangle  -> dim1 * dim2 / 2
			:ellipse   -> :math.pi() * dim1 * dim2
		end
	end
end
