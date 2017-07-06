defmodule Avionix do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Avionix.Endpoint, []),
      supervisor(Avionix.Repo, []),
      supervisor(Task.Supervisor, [[name: Avionix.TaskSupervisor]]),
#      worker(Task, [&fetch_planes/0]),
    ]

    opts = [strategy: :one_for_one, name: Avionix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Avionix.Endpoint.config_change(changed, removed)
    :ok
  end

  defp fetch_planes do
    Process.registered |> Enum.sort |> IO.inspect
    Dump1090.start
    Dump1090.get!("/data.json")
    #Poison.decode!(body), as: [Avionix.Event]
    System.halt
  end
end
