defmodule WeatherFetch.CLI do
  @moduledoc """
  CLI module
  """

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    case  parse  do

      { [ help: true ], _, _ } -> :help
      { _, [ location, stat ], _ }   -> { location, stat }
      { _, [ location], _ }   -> { location, "current_observation" }
      _                        -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: weather_fetch <location>
    """
  end

  def process({location, stat}) do
    WeatherFetch.Xml.fetch(location, stat)
  end
end
