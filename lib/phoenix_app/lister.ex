defprotocol PhoenixApp.Lister do
  @fallback_to_any true
  @doc "Transform input to list"
  def to_list(input)
end
