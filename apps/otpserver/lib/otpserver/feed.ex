defmodule Otpserver.Feed do
	@moduledoc """
    Feed responsible for making calls to Twitter API based on state or new search params
  """

  def new_server(params) do
    FeedServer.start_link(params)
  end

  def refresh(state) do
  	IO.puts state.last_search
   	response = search(state.last_search)
   	response
  end

  def get_feed(state, search_term) do
  	IO.puts state.last_search
  	query = search_term
    response = search(query)
    response
  end

  defp search(query) do
  	response = ExTwitter.search("#{query}", [count: 20]) |>
   			Enum.map(fn(tweet) -> [tweet.text, urls(tweet)] end)
  end

  defp urls(tweet) do
  	tweet
  	|> Map.get(:entities)
  	|> Map.get(:urls)
  	|> Enum.map(&Map.get(&1, :display_url))
  end

  defp username(tweet) do
  	tweet
  	|> Map.get(:user)
  	|> Enum.map(&Map.get(&1, :name))
  end

end
