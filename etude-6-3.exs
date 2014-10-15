defmodule Teeth do

    def alert(list) when length(list) == 32 do
        alert(list, 1, [])
    end

    defp alert([], _, result) do
        Enum.reverse(result)
    end

    defp alert([head | tail], tooth_number, result) do
        if Enum.max(head) >= 4 do 
            result = [tooth_number | result]
        end
        alert tail, tooth_number + 1, result
    end

    def pocket_depths do
        [
            [0],
            [2,2,1,2,2,1],
            [3,1,2,3,2,3],
            [3,1,3,2,1,2],
            [3,2,3,2,2,1],
            [2,3,1,2,1,1],
            [3,1,3,2,3,2],
            [3,3,2,1,3,1], 
            [4,3,3,2,3,3],
            [3,1,1,3,2,2], 
            [4,3,4,3,2,3], 
            [2,3,1,3,2,2],
            [1,2,1,1,3,2], 
            [1,2,2,3,2,3], 
            [1,3,2,1,3,3], 
            [0],
            [3,2,3,1,1,2], 
            [2,2,1,1,3,2], 
            [2,1,1,1,1,2],
            [3,3,2,1,1,3], 
            [3,1,3,2,3,2], 
            [3,3,1,2,3,3],
            [1,2,2,3,3,3], 
            [2,2,3,2,3,3], 
            [2,2,2,4,3,4],
            [3,4,3,3,3,4], 
            [1,1,2,3,1,2], 
            [2,2,3,2,1,3],
            [3,4,2,4,4,3], 
            [3,3,2,1,2,3], 
            [2,2,2,2,3,3],
            [3,2,3,2,3,2]
        ]
    end

end


Teeth.alert(Teeth.pocket_depths())
