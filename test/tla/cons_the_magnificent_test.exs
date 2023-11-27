defmodule TLA.ConsTheMagnificentTest do
  use ExUnit.Case

  import TLA.ConsTheMagnificent, only: [rember: 2, firsts: 1, insertR: 3, insertL: 3, subst: 3]

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

  test "insertR( :foo, :bar, [ ]) == []" do
    assert insertR(:foo, :bar, []) == []
  end

  test "insertR( :foo, :bar, [:bar]) == [:bar, :foo]" do
    assert insertR(:foo, :bar, [:bar]) == [:bar, :foo]
  end

  test "insertR( :foo, :bar, [:bar, :quux]) == [:bar, :foo, :quux]" do
    assert insertR(:foo, :bar, [:bar, :quux]) == [:bar, :foo, :quux]
  end

  test "insertR( :topping, :fudge, [ :ice, :cream, :with, :fudge, :for, :dessert]) == [:ice, :cream, :with, :fudge, :topping, :for, :dessert]" do
    assert insertR(:topping, :fudge, [:ice, :cream, :with, :fudge, :for, :dessert]) ==
             [:ice, :cream, :with, :fudge, :topping, :for, :dessert]
  end

  test "insertL( :foo, :bar, [ ]) == []" do
    assert insertL(:foo, :bar, []) == []
  end

  test "insertL( :foo, :bar, [:bar]) == [:foo, :bar]" do
    assert insertL(:foo, :bar, [:bar]) == [:foo, :bar]
  end

  test "insertL( :foo, :bar, [:bar, :quux]) == [:foo, :bar, :quux]" do
    assert insertL(:foo, :bar, [:bar, :quux]) == [:foo, :bar, :quux]
  end

  test "susbt( :foo, :bar, []) == []" do
    assert subst(:foo, :bar, []) == []
  end

  test "susbt( :foo, :bar, [:bar]) == [:foo]" do
    assert subst(:foo, :bar, [:bar]) == [:foo]
  end

  test "susbt( :foo, :bar, [:quux, :bar, :baz]) == [:quux, :foo, :baz]" do
    assert subst(:foo, :bar, [:quux, :bar, :baz]) == [:quux, :foo, :baz]
  end
end
