defmodule EmanagerWeb.PageController do
  use EmanagerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
