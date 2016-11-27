# Exercise: ListsAndRecursion-1 in Programming Elixr 1.3 by Dave Thomas

defmodule MyList do
  def mapsum([], _func) do
    0
  end

  def mapsum([ head | tail ],func) do
    func.(head)+mapsum(tail, func)
  end
end
