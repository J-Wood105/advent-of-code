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

  def countIncreased([_head], count) do
    count
  end

  def create_sliding_scale(depths, sliding_sums \\ []) do
    next_sliding = depths
      |> Enum.take(3)
      |> Enum.reduce(0, fn x, acc -> acc + x end)
    sliding_sums = Enum.concat(sliding_sums, [next_sliding])
    [_head | rest] = depths
    case length(rest) > 2 do
      true -> create_sliding_scale(rest, sliding_sums)
      false -> sliding_sums
    end
  end

  def stream_file(filepath) do
    File.stream!(filepath)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list
  end

  def solveInput(filepath) do
    filepath
    |> stream_file
    |> countIncreased
  end

  def solve_sliding_sums_input(filepath) do
    filepath
    |> stream_file
    |> IO.inspect
    |> create_sliding_scale
    |> countIncreased
  end

end

