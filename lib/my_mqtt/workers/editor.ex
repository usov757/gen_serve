defmodule Editor do
  use GenServer

  def start_link(list) do
    GenServer.start_link(__MODULE__, list, name: __MODULE__)
  end

  ## Callbacks

  @impl true
  def init(list) do
    {:ok, list}
  end

  @impl true
  def handle_call(:get, _from, list) do
    {:reply, list, list}
  end

  def handle_call({:add, value}, _from, list) do
    {:reply, [value | list], [value | list]}
  end

  def handle_cast(:clean, _from) do
    newList = []
    {:noreply, newList}
  end
end
