defmodule TeslaMateWeb.Version do
  import Plug.Conn
  import File

  def init(opts), do: opts

  def call(%Plug.Conn{request_path: "/version"} = conn, _opts) do
    case File.read("../../VERSION") do
      {:ok, body}      -> # do something with the `body`
        conn
        |> send_resp(200, body)
        |> halt()
      {:error, reason} -> # handle the error caused by `reason`
        conn
        |> send_resp(500, reason)
        |> halt()
    end
  end

  def call(conn, _opts), do: conn
end
