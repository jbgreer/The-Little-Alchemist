defmodule TLA.ConsTheMagnificent do
  @moduledoc """
  Based on The Little Schemer, 4th Edition, Ch 3. Cons the Magnificent
  """
  import TLA.Prelude, only: [cons: 2]

  @doc """
  Removes the first instance of atom 'a' in list of atoms 'lat'
  """
  def rember(a, lat) do
    case lat do
      [] -> []
      [^a | l] -> l
      [h | l] -> cons(h, rember(a, l))
    end
  end

  @doc """
  Given a possibly empty list of sublists of atoms, returns a list of the first atom of every sublist
  """
  def firsts(l) do
    case l do
      [] -> []
      [h | l] -> cons(hd(h), firsts(l))
    end
  end

  @doc """
  Given a list of atoms 'lat', insert an atom 'new' to the right of the first instance of atom 'old'
  """
  def insertR(new, old, lat) do
    case lat do
      [] -> []
      [^old | t] -> cons(old, cons(new, t))
      [h | t] -> cons(h, insertR(new, old, t))
    end
  end

  @doc """
  Given a list of atoms 'lat', insert an atom 'new' to the left of the first instance of atom 'old'
  """
  def insertL(new, old, lat) do
    case lat do
      [] -> []
      [^old | _] -> cons(new, lat)
      [h | t] -> cons(h, insertL(new, old, t))
    end
  end
end
