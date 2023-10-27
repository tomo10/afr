defmodule AfrTest do
  use ExUnit.Case
  doctest Afr

  test "greets the world" do
    assert Afr.hello() == :world
  end
end
