defmodule TLA.Prelude do
  @moduledoc """
  Based The Little Schemer, 4th Edition, Prelude
  """

  @doc """
  Creates a list from an atom and a possibly empty list

  Example

  """
  @spec cons(atom(), list(atom())) :: list(atom)
  def cons(a, l) do
    [a | l]
  end
end
