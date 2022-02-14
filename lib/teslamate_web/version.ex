defmodule TeslaMateWeb.Version do
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{request_path: "/version"} = conn, _opts) do
    conn
    |> send_resp(200, "<<VERSION>>")
    |> halt()
  end

  def call(conn, _opts), do: conn
end
