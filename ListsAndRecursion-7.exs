# In the last exercise of Chapter 7, Lists and Recursion, on page 65, you wrote a span function. Use it and list comprehensions to return a list of the prime numbers from 2 to n.

defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to) ]

  def is_prime(2), do: true
  def is_prime(x) do
    Enum.all?(span(2, x-1), &(rem(x, &1) !== 0))
  end

  def prime(n) do
    for x <- span(2, n), is_prime(x), do: x
  end
end
