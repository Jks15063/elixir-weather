defmodule WeatherFetch.Xml do

  require Logger

  @user_agent  [ {"User-agent", "Elixir jake@foo.com"} ]

  @moduledoc """
  Get the current weather
  """

  def fetch(location, stat) do
    Logger.info "Fetching the weather"
    weather_url(location)
    |> HTTPoison.get(@user_agent)
    |> handle_response(stat)
  end

  def handle_response({:ok, %{status_code: 200, body: body}}, stat) do
    Logger.info "Successful response"
    Logger.debug fn -> inspect(body) end
    doc = Exml.parse(body)
    { :ok, Exml.get(doc, "//#{stat}")}
  end

  def handle_response({_, %{status_code: status, body: body}}, _stat) do
    Logger.error "Error #{status} returned"
    { :error, Exml.parse(body) }
  end

  @weather_url Application.get_env(:weather_fetch, :weather_url)

  def weather_url(airport_abbrev) do
    "#{@weather_url}#{airport_abbrev}.xml"
  end

end
