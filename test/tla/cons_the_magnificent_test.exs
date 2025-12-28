defmodule TLA.ConsTheMagnificentTest do
  use ExUnit.Case

  import TLA.ConsTheMagnificent,
    only: [
      rember: 2,
      firsts: 1,
      insert_r: 3,
      insert_l: 3,
      subst: 3,
      subst2: 4,
      multi_rember: 2,
      multi_insert_r: 3,
      multi_insert_l: 3,
      multi_subst: 3
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

  test "insert_r( :foo, :bar, [ ]) == []" do
    assert insert_r(:foo, :bar, []) == []
  end

  test "insert_r( :foo, :bar, [:bar]) == [:bar, :foo]" do
    assert insert_r(:foo, :bar, [:bar]) == [:bar, :foo]
  end

  test "insert_r( :foo, :bar, [:bar, :quux]) == [:bar, :foo, :quux]" do
    assert insert_r(:foo, :bar, [:bar, :quux]) == [:bar, :foo, :quux]
  end

  test "insert_r( :topping, :fudge, [ :ice, :cream, :with, :fudge, :for, :dessert]) == [:ice, :cream, :with, :fudge, :topping, :for, :dessert]" do
    assert insert_r(:topping, :fudge, [:ice, :cream, :with, :fudge, :for, :dessert]) ==
             [:ice, :cream, :with, :fudge, :topping, :for, :dessert]
  end

  test "insert_l( :foo, :bar, [ ]) == []" do
    assert insert_l(:foo, :bar, []) == []
  end

  test "insert_l( :foo, :bar, [:bar]) == [:foo, :bar]" do
    assert insert_l(:foo, :bar, [:bar]) == [:foo, :bar]
  end

  test "insert_l( :foo, :bar, [:bar, :quux]) == [:foo, :bar, :quux]" do
    assert insert_l(:foo, :bar, [:bar, :quux]) == [:foo, :bar, :quux]
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

  test "multi_rember( :foo, []) == []" do
    assert multi_rember(:foo, []) == []
  end

  test "multi_rember( :foo, [:foo]) == []" do
    assert multi_rember(:foo, [:foo]) == []
  end

  test "multi_rember( :foo, [:bar]) == [:bar]" do
    assert multi_rember(:foo, [:bar]) == [:bar]
  end

  test "multi_rember( :foo, [:foo, :bar]) == [:bar]" do
    assert multi_rember(:foo, [:foo, :bar]) == [:bar]
  end

  test "multi_rember( :foo, [:bar, :foo]) == [:bar]" do
    assert multi_rember(:foo, [:bar, :foo]) == [:bar]
  end

  test "multi_rember( :foo, [:bar, :foo, :quux, :foo]) == [:bar, :quux]" do
    assert multi_rember(:foo, [:bar, :foo, :quux, :foo]) == [:bar, :quux]
  end

  test "multi_insert_r( :bar, :foo, [:foo, :quux, :foo]) == [:foo, :bar, :quux, :foo, :bar]" do
    assert multi_insert_r(:bar, :foo, [:foo, :quux, :foo]) == [
             :foo,
             :bar,
             :quux,
             :foo,
             :bar
           ]
  end

  test "multi_insert_l( :bar, :foo, [:foo, :quux, :foo]) == [:bar, :foo, :quux, :bar, :foo]" do
    assert multi_insert_l(:bar, :foo, [:foo, :quux, :foo]) == [
             :bar,
             :foo,
             :quux,
             :bar,
             :foo
           ]
  end

  test "multi_subst( :bar, :foo, [:foo, :quux, :foo]) == [:bar, :quux, :foo]" do
    assert multi_subst(:bar, :foo, [:foo, :quux, :foo]) == [
             :bar,
             :quux,
             :bar
           ]
  end

  test "multi_insert_r( :foo, :bar, [) == []" do
    assert multi_insert_r(:foo, :bar, []) == []
  end

  test "multi_insert_r( :foo, :bar, [:bar) == [:bar, :foo]" do
    assert multi_insert_r(:foo, :bar, [:bar]) == [:bar, :foo]
  end

  test "multi_insert_r( :foo, :bar, [:bar, :quux, :bar) == [:bar, :foo, :quux, :bar, :foo]" do
    assert multi_insert_r(:foo, :bar, [:bar, :quux, :bar]) == [:bar, :foo, :quux, :bar, :foo]
  end

  test "multi_insert_l( :foo, :bar, [) == []" do
    assert multi_insert_l(:foo, :bar, []) == []
  end

  test "multi_insert_l( :foo, :bar, [:bar) == [:foo, :bar]" do
    assert multi_insert_l(:foo, :bar, [:bar]) == [:foo, :bar]
  end

  test "multi_insert_l( :foo, :bar, [:bar, :quux, :bar) == [:foo, :bar, :quux, :foo, :bar]" do
    assert multi_insert_l(:foo, :bar, [:bar, :quux, :bar]) == [:foo, :bar, :quux, :foo, :bar]
  end
end
