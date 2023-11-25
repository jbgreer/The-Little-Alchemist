defmodule TLA.DoItAgain do
  def cons(a, l) do
    [a | l]
  end

  def lat?(lat) do
    case lat do
      [] -> true
      [a | l] -> is_atom(a) and lat?(tl(l))
      _ -> false
    end
  end

  def member?(a, lat) do
    case lat do
      [] -> false
      [h | t] -> h == a or member?(a, t)
    end
  end
end
