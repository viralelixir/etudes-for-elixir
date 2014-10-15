defmodule AskArea do
    def area do
        user_input = IO.gets "R)ectangle, T)riangle, or E)llipse: "
        shape_input = String.upcase(String.first(user_input))
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
            _   -> :unknown
        end
    end

    defp get_number(prompt) do
        user_input = IO.gets "Enter #{prompt} > "
        stripped_input = String.strip(user_input)
        cond do
            Regex.match?(~r/^[0-9]+\.[0-9]+$/, stripped_input) -> String.to_float(stripped_input)
            Regex.match?(~r/^[0-9]+$/, stripped_input) -> String.to_integer(stripped_input)
            true -> {:error, prompt}
        end
    end

    defp get_dimensions(prompt1, prompt2) do
        {get_number(prompt1), get_number(prompt2)}
    end

    def calculate(atom, dim1, dim2) do
        case {atom, dim1, dim2} do
            {:unknown, _, _} -> ""
            {_, {:error, prompt}, _} -> IO.puts "Please provide a valid number for #{prompt}"
            {_, _, {:error, prompt}} -> IO.puts "Please provide a valid number for #{prompt}"
            {_, dim1, dim2} when dim1 < 0 or dim2 < 0 -> IO.puts "Both numbers must be greater than or equal to zero."
            _ -> Geom.area(atom, dim1, dim2)
        end
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
