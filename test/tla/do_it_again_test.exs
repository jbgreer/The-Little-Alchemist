defmodule TLA.DoItAgainTest do
  use ExUnit.Case
  # doctest TLA.Toys

  import TLA.DoItAgain, only: [lat?: 1]

  # Law of Car Test
  test "lat?([:foo, :bar]) == true" do
    assert lat?([:foo, :bar]) == true
  end

end
