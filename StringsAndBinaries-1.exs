defmodule MyString do
  def printable_ascii(sqs), do: Enum.all?(sqs, &(&1 in ?\s..?~))
end
