defmodule PhoenixApp.ListerTest do
  use ExUnit.Case, async: true
  alias PhoenixApp.Lister

  describe "to_list/1" do
    test "converts a string into a list of its graphemes" do
      assert Lister.to_list("Lister") == ["L", "i", "s", "t", "e", "r"]
      assert Lister.to_list("") == []
    end

    test "expands a range into a list of numbers" do
      assert Lister.to_list(1..3) == [1, 2, 3]
    end

    test "converts a map into a list of key-value tuples" do
      assert Lister.to_list(%{a: 1, b: 2, c: 3}) == [a: 1, b: 2, c: 3]
    end

    test "returns an existing list unchanged" do
      assert Lister.to_list([1, 2, 3]) == [1, 2, 3]
      assert Lister.to_list([]) == []
    end

    test "wraps numbers and atoms into a single-element list" do
      assert Lister.to_list(42) == [42]
      assert Lister.to_list(3.14) == [3.14]
      assert Lister.to_list(:ok) == [:ok]
    end

    test "converts nil atom into an empty list" do
      assert Lister.to_list(nil) == []
    end

    test "handles tuples via the any fallback" do
      assert Lister.to_list({:user, 1}) == [:user, 1]
    end

    test "handles map sets via the any fallback" do
      set = MapSet.new([1, 2])
      assert Lister.to_list(set) == [1, 2]
    end
  end
end
