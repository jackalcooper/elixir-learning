# Write a function that takes a list of dqs and prints each on a separate line, centered in a column that has the width of the longest string. Make sure it works with UTF characters.

defmodule MyString do

  def center([]), do: :ok
  def center([ head | tail ]) do
    line_width = line_width([ head | tail ])
    IO.puts("#{String.duplicate(" ", div(line_width - String.length(head), 2))}" <> head)
    center(tail)
  end

  defp line_width([]), do: 0
  defp line_width([ head | tail ]) do
    max(String.length(head),line_width(tail))
  end

end
