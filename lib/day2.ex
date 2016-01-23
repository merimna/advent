defmodule Day2 do
    import MultiDef

    def splitLine(a) do
        a
        |> String.split("x")
        |> Enum.map(&convertToNum/1)
        |> Enum.sort
        |> List.to_tuple
    end

    mdef convertToNum do
        a when is_binary(a) -> String.to_integer(a)
        a -> a
    end

    def calcSideAreas(dims) do
        length = elem(dims, 0)
        height = elem(dims, 1)
        width = elem(dims, 2)

        %{
            :one => length * height,
            :two => height * width,
            :three => length * width
        }
    end

    def calcBoxArea(sides) do
        doubled = Enum.map(sides, fn {_, v} -> v * 2 end)
        Enum.reduce(doubled, fn a, b -> a + b end)
    end

    def calcSlack(sides) do
        Enum.min([
        sides[:one],
        sides[:two],
         sides[:three]
         ])
    end

    def calcArea(a) do
    sides =
    a
    |> splitLine
    |> calcSideAreas

    calcBoxArea(sides) + calcSlack(sides)
    end

    def calcRibbonLength(a) do
        calcRibbonWrap(a) + calcRibbonBow(a)
    end
    def calcRibbonWrap(a) do
        (elem(a, 0) * 2) + (elem(a, 1) * 2)
    end
    def calcRibbonBow(a) do
    a
    |> Tuple.to_list
    |> Enum.reduce(1, fn v, acc -> v * acc end)
    end
end

"data/day2"
|> File.read!
|> String.split("\n")
|> Enum.map(&Day2.calcArea/1)
|> Enum.reduce(fn a, b -> a + b end)
|> IO.puts

"data/day2"
|> File.read!
|> String.split("\n")
|> Enum.map(&Day2.splitLine/1)
|> Enum.map(&Day2.calcRibbonLength/1)
|> Enum.reduce(fn a, b -> a + b end)
|> IO.puts



