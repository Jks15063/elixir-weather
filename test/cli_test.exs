defmodule CliTest do
  use ExUnit.Case
  doctest WeatherFetch

  import WeatherFetch.CLI, only: [ parse_args: 1, process: 1 ]

  test ":help returned by option parsing --help and -h options" do
    assert parse_args(["-h",     "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "two values returned if two given" do
    assert parse_args(~w(KDEN temp_f)) == {"KDEN", "temp_f"}
  end

  test "stat defaults to current_observation if one value is given" do
    assert parse_args(~w(KDEN)) == {"KDEN", "current_observation"}
  end
end
