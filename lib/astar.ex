defmodule AStar do
  @moduledoc """
  TODO: Documentation for `AStar`.
  """

  use Rustler, otp_app: :astar, crate: "astar"

  @type coord :: {non_neg_integer(), non_neg_integer()}

  ## Public API

  # AStar.path(<<0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0>>,5,5,{0,0},{4,4})
  @spec path(binary(), pos_integer(), pos_integer(), coord(), coord()) ::
          {:ok, [coord()]} | {:error, atom()}
  def path(_map, _width, _height, _start, _end), do: err()

  # Helpers

  defp err(), do: :erlang.nif_error(:nif_not_loaded)
end
