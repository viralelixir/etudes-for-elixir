defmodule ListComp do 
    def filterAnd(list) do
        Enum.filter(list, fn {_, sex, age} -> sex == "M" && age >= 40 end)
    end

    def lcAnd(list) do
        for {name, sex, age} <- list, sex == "M", age > 40, do: {name, sex, age}
    end

    def filterOr(list) do
        Enum.filter(list, fn {_, sex, age} -> sex == "M" || age >= 40 end)
    end

    def lcOr(list) do
        for {name, sex, age} <- list, sex == "M" || age > 40, do: {name, sex, age}
    end

    def get_people do
        [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30},
          {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]
    end
end
