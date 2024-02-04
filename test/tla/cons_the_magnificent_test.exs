defmodule TLA.ConsTheMagnificentTest do
  use ExUnit.Case

  import TLA.ConsTheMagnificent,
    only: [
      rember: 2,
      firsts: 1,
      insertR: 3,
      insertL: 3,
      subst: 3,
      subst2: 4,
      multirember: 2,
      multiinsertR: 3,
      multiinsertL: 3,
      multisubst: 3
    ]

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

  test "susbt2( :foo, :bar, :quux, []) == []" do
    assert subst2(:foo, :bar, :quux, []) == []
  end

  test "susbt2( :foo, :bar, :quux, [:bar]) == [:foo]" do
    assert subst2(:foo, :bar, :quux, [:bar]) == [:foo]
  end

  test "susbt2( :foo, :bar, :quux, [:quux]) == [:foo]" do
    assert subst2(:foo, :bar, :quux, [:quux]) == [:foo]
  end

  test "multirember( :foo, []) == []" do
    assert multirember(:foo, []) == []
  end

  test "multirember( :foo, [:foo]) == []" do
    assert multirember(:foo, [:foo]) == []
  end

  test "multirember( :foo, [:bar]) == [:bar]" do
    assert multirember(:foo, [:bar]) == [:bar]
  end

  test "multirember( :foo, [:foo, :bar]) == [:bar]" do
    assert multirember(:foo, [:foo, :bar]) == [:bar]
  end

  test "multirember( :foo, [:bar, :foo]) == [:bar]" do
    assert multirember(:foo, [:bar, :foo]) == [:bar]
  end

  test "multirember( :foo, [:bar, :foo, :quux, :foo]) == [:bar, :quux]" do
    assert multirember(:foo, [:bar, :foo, :quux, :foo]) == [:bar, :quux]
  end

  test "multiinsertR( :bar, :foo, [:foo, :quux, :foo]) == [:foo, :bar, :quux, :foo, :bar]" do
    assert multiinsertR(:bar, :foo, [:foo, :quux, :foo]) == [
             :foo,
             :bar,
             :quux,
             :foo,
             :bar
           ]
  end

  test "multiinsertL( :bar, :foo, [:foo, :quux, :foo]) == [:bar, :foo, :quux, :bar, :foo]" do
    assert multiinsertL(:bar, :foo, [:foo, :quux, :foo]) == [
             :bar,
             :foo,
             :quux,
             :bar,
             :foo
           ]
  end

  test "multisubst( :bar, :foo, [:foo, :quux, :foo]) == [:bar, :quux, :foo]" do
    assert multisubst(:bar, :foo, [:foo, :quux, :foo]) == [
             :bar,
             :quux,
             :bar
           ]
  end
end
