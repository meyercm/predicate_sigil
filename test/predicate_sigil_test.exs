defmodule PredicateSigilTest do
  use ExUnit.Case
  doctest PredicateSigil

  test "greets the world" do
    assert PredicateSigil.hello() == :world
  end
end
