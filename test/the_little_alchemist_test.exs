defmodule TheLittleAlchemistTest do
  use ExUnit.Case
  doctest TheLittleAlchemist

  test "greets the world" do
    assert TheLittleAlchemist.hello() == :world
  end
end
