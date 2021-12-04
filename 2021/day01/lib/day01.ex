defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day01.hello()
      :world

  """
  def hello do
    :world
  end

  def countIncreased([_head], count) do
    count
  end

  def countIncreased([head, next | rest]) do
    case head < next do
      true -> countIncreased([next | rest], 1)
      false -> countIncreased([next | rest])
    end
  end

  def countIncreased([head, next | rest], count) do
    case head < next do
      true -> countIncreased([next | rest], 1 + count)
      false -> countIncreased([next | rest], count)
    end
  end

end

