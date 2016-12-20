defmodule Twitter.PageController do
  use Twitter.Web, :controller
  @moduledoc """
    Page controller responsible for connecting with OTP Server and displaying Tweets
  """

  def index(conn, _params) do
    render(
           conn,
           "index.html",
           current_user: get_session(conn, :current_user))
  end

  def show(conn, _params) do
    pid = elem(get_session(conn, :current_user).pid, 1)
    IO.inspect get_session(conn, :current_user)
    IO.inspect(Otpserver.FeedServer.refresh(pid))
    render(
          conn,
          "show.html",
          current_user: get_session(conn, :current_user),
          feed: Otpserver.FeedServer.refresh(pid)
          )
  end

  def update(conn, _params) do
    pid = elem(get_session(conn, :current_user).pid, 1)
    IO.puts(conn.params["search"]["for"])
    IO.inspect(Otpserver.FeedServer.get_feed(pid, conn.params["search"]["for"]))
    render(
          conn,
          "show.html",
          current_user: get_session(conn, :current_user),
          feed: Otpserver.FeedServer.get_feed(pid, conn.params["search"]["for"])
          )
  end

end
