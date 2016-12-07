# Write a function that takes a list of dqs and prints each on a separate line, centered in a column that has the width of the longest string. Make sure it works with UTF characters.

defmodule MyString do

  def center(list) do
    Enum.each(list, &center_dqs(&1, line_width(list)))
  end

  defp center_dqs(str, line_width) do
    "#{String.duplicate(" ", div(line_width - String.length(str), 2))}" <> str |> IO.puts
  end

  defp line_width([]), do: 0
  defp line_width([ head | tail ]) do
    max(String.length(head),line_width(tail))
  end

end
