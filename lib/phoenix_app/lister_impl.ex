defimpl PhoenixApp.Lister, for: BitString do
  def to_list(string), do: String.graphemes(string)
end

defimpl PhoenixApp.Lister, for: Range do
  def to_list(range), do: Enum.to_list(range)
end

defimpl PhoenixApp.Lister, for: Map do
  def to_list(map) do
    map
    |> Map.to_list()
    |> Enum.sort()
  end
end

defimpl PhoenixApp.Lister, for: List do
  def to_list(list), do: list
end

defimpl PhoenixApp.Lister, for: [Integer, Float] do
  def to_list(number), do: [number]
end

defimpl PhoenixApp.Lister, for: Atom do
  def to_list(nil), do: []
  def to_list(atom), do: [atom]
end

defimpl PhoenixApp.Lister, for: Any do
  def to_list(input) do
    cond do
      Enumerable.impl_for(input) -> Enum.to_list(input)
      is_tuple(input) -> Tuple.to_list(input)
      true -> [input]
    end
  end
end
