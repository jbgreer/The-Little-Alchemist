defmodule TLA.ConsTheMagnificent do
  import TLA.Prelude, only: [cons: 2]

  def rember(a, lat) do
    case lat do
      [] -> []
      [h | l] when h == a -> l
      [h | l] -> cons(h, rember(a, l))
    end
  end
end
