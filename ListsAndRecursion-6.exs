# This is an exercise to implement the List.flatten function.

# 1st version: it doesn't work, because I use an old function in a guard clause. I may fix this bug with some macro later.

defmodule MyList do
  def exist_list([]), do: false
  def exist_list([ head | tail ]) do
    if is_list(head) do
      true
    else
      exist_list(tail)
    end
  end

  def flatten(list) when exist_list(list) == false, do: list
  def flatten([ head | tail ]) do
    if is_list(head) do
      flatten(head) ++ flatten(tail)
    else
      [ head | flatten(tail) ]
    end
  end
end

# 2nd version: it is simpler and it works fine.
defmodule MyList do
  def flatten([]), do: []
  def flatten([ head | tail ]) do
    if is_list(head) do
      flatten(head) ++ flatten(tail)
    else
      [ head | flatten(tail) ]
    end
  end
end
