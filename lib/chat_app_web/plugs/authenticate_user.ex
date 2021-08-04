defmodule ChatAppWeb.Plugs.AuthenticateUser do
  import Plug.Conn
  import Phoenix.Controller

  alias ChatAppWeb.Router.Helpers, as: Routes

  def init(_params) do

  end

  def call(conn, _params) do
    if conn.assigns.signed_in? do
      conn
    else
      conn
      |> put_flash(:error, "You must sign in first!")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end


end
