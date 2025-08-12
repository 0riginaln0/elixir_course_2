defmodule ProcessesExample do
  def run_processes(num, ppid) do
    for id <- 1..num, do: spawn(__MODULE__, :start, [id, ppid])
  end

  def start(id, ppid) do
    IO.puts("Start new process with id: #{id} and pid: #{inspect(self())}")
    Process.sleep(Enum.random(10..1000))
    send(ppid, "Hello from process ##{id}")
    IO.puts("process with id: #{id} and pid: #{inspect(self())} has been finished")
  end
end
