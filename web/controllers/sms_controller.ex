defmodule Philter.SmsController do
  use Philter.Web, :controller

  def index(conn, %{"Body" => song, "From" => from, "To" => to}) do
    resp = ExTwilio.Message.create([
      From: to,
      To: from,
      Body: "Your clip is on the way!"
    ])

    # %{"Body" => song, "From" => from, "To" => to} = conn.params

    # Task.start_link(fn -> search_spotify(song, %{from: from, to: to}) end)
    IO.inspect resp
    conn
    |> send_resp(200, "")
  end

  defp search_spotify(song, twilio_data) do
    Philter.Spotify.search(song, twilio_data)
  end

end
