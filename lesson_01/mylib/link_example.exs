defmodule LinkExample do
  def run(num_processes) do
    for id <- 1..num_processes, do: spawn_link(__MODULE__, :start_new_process, [id])
  end

  def start_new_process(id) do
    IO.puts("Process id: #{id}, pid: #{inspect(self())} started")

    if id == 3 do
      exit(:some_reason)
    end

    Process.sleep(Enum.random(10..500))
    IO.puts("Process id: #{id}, pid: #{inspect(self())} stopped")
  end
end
