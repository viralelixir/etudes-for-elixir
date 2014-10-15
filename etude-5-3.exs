defmodule Dates do
    def date_parts(input) do
        String.split(input, "-")
    end
end

IO.puts Dates.date_parts("2013-06-15")
