defmodule TLA.ConsTheMagnificentTest do
  use ExUnit.Case

  import TLA.ConsTheMagnificent, only: [rember: 2, firsts: 1]

  test "rember(:foo, []) == []" do
    assert rember(:foo, []) == []
  end

  test "rember(:foo, [:foo]) == []" do
    assert rember(:foo, [:foo]) == []
  end

  test "rember(:foo, [:foo, :bar]) == [:bar]" do
    assert rember(:foo, [:foo, :bar]) == [:bar]
  end

  test "rember(:foo, [:bar, :foo]) == [:bar]" do
    assert rember(:foo, [:bar, :foo]) == [:bar]
  end

  test "rember(:foo, [:bar, :foo, :quux]) == [:bar]" do
    assert rember(:foo, [:bar, :foo, :quux]) == [:bar, :quux]
  end

  test "firsts( []  ) == []" do
    assert firsts([]) == []
  end

  test "firsts( [ [:apple, :peach, :pumpkin], [:plum, :pear, :cherry], [:grape, :raisin, :pea] ] ) == [:apple, :plum, :grape]" do
    assert firsts([[:apple, :peach, :pumpkin], [:plum, :pear, :cherry], [:grape, :raisin, :pea]]) ==
             [:apple, :plum, :grape]
  end

  test "firsts( [ [ [:apple], :peach], [:plum, :pear] ] ) == [ [:apple], :plum]" do
    assert firsts([[[:apple], :peach], [:plum, :pear]]) == [[:apple], :plum]
  end
end
