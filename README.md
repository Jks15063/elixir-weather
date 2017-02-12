# WeatherFetch

**Get the weather**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `weather_fetch` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:weather_fetch, "~> 0.1.0"}]
    end
    ```

  2. Ensure `weather_fetch` is started before your application:

    ```elixir
    def application do
      [applications: [:weather_fetch]]
    end
    ```
