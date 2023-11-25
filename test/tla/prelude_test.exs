defmodule TLA.PreludeTest do
  use ExUnit.Case
  # doctest TLA.Prelude

  import TLA.Prelude, only: [cons: 2]

  test "Cons a:" do
    assert cons(:a, []) == [:a]
  end

  test "Cons 1" do
    assert cons(1, []) == [1]
  end

  test "Cons []" do
    assert cons([], []) == [[]]
  end

  test "Cons [1, 2, 3]" do
    assert cons([1, 2, 3], []) == [[1, 2, 3]]
  end

  # [+ |  [1, 2]]      # error
end
