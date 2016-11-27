# Exercise: ListsAndRecursion-2 in Programming Elixr 1.3 by Dave Thomas
# Write a max(list) that returns the element with the maximum value in the list. (This is slightly trickier than it sounds.)

defmodule MyList do
  def max([]) do
    IO.puts "The list is empty."
  end

  def max([ head | [] ]) do
    head
  end

  def max([ head | tail ]) do
    if head < max(tail), do: max(tail)
  end
end

# Official Solution

defmodule MyList do

  # max([]) is undefined...

  # max of a single element list is that element
  def max([x]), do: x

  # else recurse
  def max([ head | tail ]), do: Kernel.max(head, max(tail))

end
