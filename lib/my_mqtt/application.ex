defmodule MyMqtt.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: MyMqtt.Worker.start_link(arg)
      # {MyMqtt.Worker, arg}
      {Counter, 0},
      {Editor, [1, 2, 3]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyMqtt.Supervisor]

    # Supervisor.start_link(children, opts)

    # Now we start the supervisor with the children and a strategy
    {:ok, _pid} = Supervisor.start_link(children, opts)

    # After started, we can query the supervisor for information
    # Supervisor.count_children(pid)
  end
end
