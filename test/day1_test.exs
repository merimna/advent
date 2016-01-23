defmodule Day1Test do
  use ExUnit.Case
  use ExUnit.Parameterized
  doctest Day1

  test_with_params "transform",
  fn (a, expected) ->
    assert Day1.transform(a) == expected
  end do
  [
  {'((', [1, 1]},
  {'))', [-1, -1]}
  ]
  end

  test_with_params "up and down",
      fn (a, expected) ->
        assert Day1.ding(a) == expected
      end do
      [
        {'(())', 0},
        {'()()', 0},
        {'(((', 3},
        {'(()(()(', 3},
        {'())', -1},
        {'))(', -1},
        {')))', -3},
        {')())())', -3},
      ]
  end
end
