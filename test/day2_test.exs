defmodule Day2Test do
  use ExUnit.Case
  use ExUnit.Parameterized
  doctest Day2

  test "split line and sort" do
    assert Day2.splitLine("2x1x3") == {1,2,3}
  end

  test "calculate area of sides" do
    assert Day2.calcSideAreas({2,3,4}) == %{
        :one => 6, :two => 12, :three => 8
        }
  end

  test "calculate ribbon length" do
    assert Day2.calcRibbonLength({2,3,4}) == 34
  end

  test "calculate ribbon wrap length" do
    assert Day2.calcRibbonWrap({2,3,4}) == 10
  end

  test "calculate ribbon bow length" do
    assert Day2.calcRibbonBow({2,3,4}) == 24
  end

  test "calculate slack" do
    assert Day2.calcSlack(%{:one => 6, :two => 12, :three => 8 }) == 6
    end

    test "calculate area" do
    assert Day2.calcArea("4x2x3") == 58
    end

    test "calculate box area" do
    assert Day2.calcBoxArea(%{:one => 6, :two => 12, :three => 8 }) == 52
    end
end
