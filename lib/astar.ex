defmodule AStar do
  @moduledoc """
  TODO: Documentation for `AStar`.
  """

  mix_config = Mix.Project.config()
  version = mix_config[:version]
  github_url = mix_config[:package][:links]["GitHub"]
  # Since Rustler 0.27.0, we need to change manually the mode for each env.
  # We want "debug" in dev and test because it's faster to compile.
  mode = if Mix.env() in [:dev, :test], do: :debug, else: :release

  use RustlerPrecompiled,
    otp_app: :astar,
    crate: "astar",
    version: version,
    base_url: "#{github_url}/releases/download/v#{version}",
    mode: mode,
    force_build: System.get_env("ASTAR_BUILD") in ["1", "true"]

  ## Types

  @type coord :: {non_neg_integer(), non_neg_integer()}

  ## Public API

  # AStar.path(<<0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0>>,5,5,{0,0},{4,4})
  @spec path(binary(), pos_integer(), pos_integer(), coord(), coord()) ::
          {:ok, [coord()]} | {:error, atom()}
  def path(_map, _width, _height, _start, _end), do: err()

  # Helpers

  defp err(), do: :erlang.nif_error(:nif_not_loaded)
end
