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

  @doc """
  Given a list of atoms 'lat', replace the first instance of atom 'old' with atom 'new'
  """
  def subst(new, old, lat) do
    case lat do
      [] -> []
      [^old | t] -> cons(new, t)
      [h | t] -> cons(h, subst(new, old, t))
    end
  end

  @doc """
  Given a list of atoms 'lat', replace the first instance of atom 'o1' or 'o2' with atom 'new'
  """
  def subst2(new, o1, o2, lat) do
    case lat do
      [] -> []
      [^o1 | t] -> cons(new, t)
      [^o2 | t] -> cons(new, t)
      [h | t] -> cons(h, subst2(new, o1, o2, t))
    end
  end

  @doc """
  Given a list of atoms 'lat', remove every instance of atom 'a'
  """
  def multirember(a, lat) do
    case lat do
      [] -> []
      [^a | t] -> multirember(a, t)
      [h | t] -> cons(h, multirember(a, t))
    end
  end
end
