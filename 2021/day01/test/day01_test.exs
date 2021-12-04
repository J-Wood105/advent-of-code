defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "greets the world" do
    assert Day01.hello() == :world
  end

  test "counts increases" do
    assert Day01.countIncreased([
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]) == 7
  end
end
