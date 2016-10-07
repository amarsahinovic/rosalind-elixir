defmodule Rosalind.FIB do
  @moduledoc """
  Rabbits and Recurrence Relations
  http://rosalind.info/problems/fib/

  Given: Positive integers n<=40 and k<=5

  Return: The total number of rabbit pairs that will be present after n months, 
  if we begin with 1 pair and in each generation, every pair of reproduction-age 
  rabbits produces a litter of k rabbit pairs (instead of only 1 pair).
  """

  @doc """
  # Tests

  iex> Rosalind.FIB.process(0, 3)
  0
  iex> Rosalind.FIB.process(1, 3)
  1
  iex> Rosalind.FIB.process(2, 3)
  1
  iex> Rosalind.FIB.process(3, 3)
  4
  iex> Rosalind.FIB.process(4, 3)
  7
  iex> Rosalind.FIB.process(5, 3)
  19
  iex> Rosalind.FIB.process(6, 3)
  40
  
  # Dataset 1
  iex> n = 35
  iex> k = 4
  iex> Rosalind.FIB.process(n, k)
  48127306357829

  # Dataset 2
  iex> n = 29
  iex> k = 4
  iex> Rosalind.FIB.process(n, k)
  170361678269

  """
  def process(n, k)do
    do_process(n, k, 0, 0, 1)
  end

  # Bottom-up approach
  def do_process(n, _, n, population, _), do: population
  def do_process(n, k, month, population, next_gen_newborns) do
    do_process(n, k, month + 1, population + next_gen_newborns, population * k)
  end
end