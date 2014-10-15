defmodule Dates do

    def date_parts(date_str) do
        [year, month, date] = String.split(date_str, ~r/-/)
        [String.to_integer(year), String.to_integer(month), String.to_integer(date)]
    end

    def julian(input) do
        [year, month, date] = date_parts(input)
        month_total(month - 1, days_per_month(year), 0) + date
    end

    defp month_total month, [head | tail], acc do
        case month do
            month when month > 0 -> month_total (month - 1), tail, acc + head
            _ -> acc
        end
    end

    defp days_per_month(year) do
        [31, days_in_feb(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    end

    defp days_in_feb year do
        if (is_leap_year(year)) do 
            28 + 1
        else 
            28
        end
    end

    defp is_leap_year(year) do
        (rem(year,4) == 0 and rem(year,100) != 0)
        or (rem(year, 400) == 0)
    end
end

IO.puts Dates.julian("2013-12-31")

IO.puts Dates.julian("2012-12-31")

IO.puts Dates.julian("2012-02-05")

IO.puts Dates.julian("2013-02-05")

IO.puts Dates.julian("1900-03-01")

IO.puts Dates.julian("2000-03-01")

IO.puts Dates.julian("2013-01-01")
