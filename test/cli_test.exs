defmodule CliTest do
  use ExUnit.Case
  doctest WeatherFetch

  import WeatherFetch.CLI, only: [ parse_args: 1, process: 1 ]

  test ":help returned by option parsing --help and -h options" do
    assert parse_args(["-h",     "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "gets temp for location" do
    assert process({ "KDEN", "temp_f" }) == {:ok, "29.0"}
  end
end
