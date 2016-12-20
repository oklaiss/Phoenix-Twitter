defmodule Otpserver.FeedSupervisor do

  @super :feed_supervisor

  def start_link do
    import Supervisor.Spec

    children = [
      worker(Otpserver.FeedServer, [], restart: :temporary)
    ]

    Supervisor.start_link(children, name: @super, strategy: :simple_one_for_one)
  end

  def new_server(params) do
    { :ok, pid } = Supervisor.start_child(@super, params)
    pid
  end

end
