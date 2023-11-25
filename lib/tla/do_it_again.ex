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

end
