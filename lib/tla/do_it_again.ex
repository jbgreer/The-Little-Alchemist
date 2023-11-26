defmodule TLA.DoItAgain do
  @moduledoc """
  Based on The Little Schemer, 4th Edition, Ch. 2 Do IT, Dot It Again, and Again, and Again...
  """

  @doc """
  Returns true is 'lat' is a (possibly empty) list of atoms
  """
  def lat?(lat) do
    case lat do
      [] -> true
      [a | l] -> is_atom(a) and lat?(tl(l))
      _ -> false
    end
  end

  @doc """
  Returns true if atom 'a' is in the list of atoms 'lat'
  """
  def member?(a, lat) do
    case lat do
      [] -> false
      [h | t] -> h == a or member?(a, t)
    end
  end
end
