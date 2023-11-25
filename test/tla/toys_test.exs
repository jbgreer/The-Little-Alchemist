defmodule TLA.ToysTest do
  use ExUnit.Case
  # doctest TLA.Toys

  import TLA.Toys, only: [cons: 2]

  # Law of Car Test
  test "hd([1, 2, 3]) == 1" do
    assert hd([1, 2, 3]) == 1
  end

  test "hd([:a, :b:, :c], :x, :y, :z])" do
    assert hd([[:a, :b, :c], :x, :y, :z]) == [:a, :b, :c]
  end


  test "hd([]) is undefined" do
    try do
      hd([])
    rescue
      _e in ArgumentError -> true
      _e in RuntimeError -> false
    end
  end

  test "hd([ [[hotdog:]], [and:], [pickle:], relish:] = [[hotdog:]] )" do
    assert hd([ [ [ :hotdog ] ], [ :and ], [ :pickle ], :relish ]) == [[ :hotdog ]]
  end

  test "hd(hd([ [[hotdog:]], [and:], [pickle:], relish:] )) = [hotdog:] )" do
    assert hd( hd([ [ [ :hotdog ] ], [ :and ], [ :pickle ], :relish ]) ) == [ :hotdog ]
  end

  # Law of cdr tests
  test "tl([1, 2, 3]) == 1" do
    assert tl([1, 2, 3]) == [2, 3]
  end

  test "tl(:foo) is undefined" do
    try do
      tl(:foo)
    rescue
      _e in ArgumentError -> true
      _e in RuntimeError -> false
    end
  end

  test "hd( tl( [ [:b], [:x, :y], [ [:c]] ] == [x, y]" do
    assert hd( tl( [ [:b], [:x, :y], [ [:c]] ] ) ) == [:x, :y]
  end

  # Law of cons tests
  test "cons(:peanut, []) == [:peanut]" do
    assert cons(:peanut, [] ) == [:peanut]
  end

  test "cons(:peanut, [:butter, :and, :jelly]) == [:peanut, :butter, :and, :jelly]" do
    assert cons(:peanut, [:butter, :and, :jelly]) == [:peanut, :butter, :and, :jelly]
  end

end
