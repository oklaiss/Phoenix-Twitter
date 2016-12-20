defmodule Otpserver do
  use Application
	def start(_type, _args) do
    import Supervisor.Spec, warn: false

    IO.puts "STARTING"
    children = [
      supervisor(Otpserver.FeedSupervisor, [])
    ]

    Supervisor.start_link(children, [strategy: :one_for_one, name: Otpserver.Supervisor])
  end
end
