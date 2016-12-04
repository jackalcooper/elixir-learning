defmodule MyString do
  def anagram?(word1, word2) when word1 == word2, do: false
  def anagram?(word1, word2) do
    if word1 -- word2 == [] do
      true
    else
      false
    end
  end
end
