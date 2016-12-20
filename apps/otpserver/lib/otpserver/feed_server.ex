defmodule Otpserver.FeedServer do
  @moduledoc """
    FeedServer responsible for maintaining state of search term
  """

  use GenServer
  @name :otpserver

  def start_link(params) do
    GenServer.start_link(__MODULE__, params)
  end

  def refresh(pid) do
    GenServer.call(pid, { :refresh } )
  end

  def get_feed(pid, search_term) do
    GenServer.call(pid, { :get_feed, search_term } )
  end

  ########################
  # END OF PUB INTERFACE #
  ########################

  def init(params) do
    # initialize default search to "phoenix framework"
    state = %{
      last_search: "phoenix framework"
    }

    { :ok, state }
  end

  def handle_call( { :refresh }, _from, state ) do
    { :reply, Otpserver.Feed.refresh(state), state }
  end

  def handle_call( { :get_feed, search_term }, _from, state ) do
    { :reply, Otpserver.Feed.get_feed(state, search_term), %{ state | last_search: search_term } }
  end

end
