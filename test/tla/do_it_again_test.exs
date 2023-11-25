defmodule TLA.DoItAgainTest do
  use ExUnit.Case
  # doctest TLA.Toys

  import TLA.DoItAgain, only: [lat?: 1, member?: 2]

  # Law of Car Test
  test "lat?([]) == true" do
    assert lat?([]) == true
  end

  test "lat?([:foo, :bar]) == true" do
    assert lat?([:foo, :bar]) == true
  end

  test "lat?([ [:foo] ]) == false" do
    assert lat?([[:foo]]) == false
  end

  test "member?(:foo, [ :foo ] ) == true" do
    assert member?(:foo, [:foo]) == true
  end

  test "member?(:foo, [ :bar, :foo ] ) == true" do
    assert member?(:foo, [:bar, :foo]) == true
  end

  test "member?(:foo, [ ] ) == false" do
    assert member?(:foo, []) == false
  end

  test "member?(:foo, [ :bar ] ) == false" do
    assert member?(:foo, [:bar]) == false
  end
end
