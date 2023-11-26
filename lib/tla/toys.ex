defmodule TLA.Toys do
  @moduledoc """
  Based The Little Schemer, 4th Edition, Ch 1: Toys
  """

  @doc """
  Given an atom `a and a possible empty list `l, return a list [ `a | `l ]
  """
  @spec cons(atom(), list(atom())) :: list(atom)
  def cons(a, l) do
    [a | l]
  end
end
