defmodule MailboxExample do
  def check_mailbox() do
    receive do
      {:ok, msg} -> log(msg)
      {:not_ok, msg} -> log(msg)
      unknown_msg -> IO.puts("process got unknown message #{inspect(unknown_msg)}")
    after
      1000 -> IO.puts("mailbox is empty")
    end
  end

  defp log(msg) do
    IO.puts("got msg #{inspect(msg)}")
  end
end
