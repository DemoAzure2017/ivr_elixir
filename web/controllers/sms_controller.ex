defmodule Philter.SmsController do
  use Philter.Web, :controller

  def index(conn, %{"Body" => song, "From" => from, "To" => to}) do
    Task.start_link(fn -> search_spotify(song, %{from: from, to: to}) end)
    conn
    |> send_resp(200, "")
  end

  defp search_spotify(song, twilio_data) do
    Philter.Spotify.search(song, twilio_data)
  end

end
