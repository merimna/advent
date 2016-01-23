defmodule Day1 do
    import MultiDef

    mdef upOrDown do
        ?( -> 1
        ?) -> -1
        _ -> 0
    end

    def transform (arr) do
        Enum.map(arr, &upOrDown/1)
    end

    def ding(instructions) do
        transformed = transform(instructions)
        Enum.reduce(transformed, 0, fn (x, acc) -> x + acc end)
    end

    def dingBasement(instructions) do
        transformed = transform(instructions)
        Enum.reduce_while(transformed, {0, 0}, fn (x, acc) ->
            if elem(acc, 1) == -1 do
             {:halt, elem(acc, 0)}
            else
             {:cont, {elem(acc,0) + 1, elem(acc,1) + x}}
            end
        end)
    end
end


data = File.read! "data/day1"
IO.puts Day1.ding(to_char_list data)
IO.puts Day1.dingBasement(to_char_list data)
