defmodule KWYE.Helpers.Utility do

   def flatten_to_map_by_inner_key(mlist, inner_key) do
      flatten_to_map_by_inner_key(mlist, inner_key, delete_key: true)
   end

   def flatten_to_map_by_inner_key(mlist, inner_key, delete_key: true) do
      for i <- mlist, into: %{}, do: {i[inner_key], (Map.delete i, inner_key)}
   end

   def flatten_to_map_by_inner_key(mlist, inner_key, delete_key: false ) do
      for i <- mlist, into: %{}, do: {i[inner_key], i}
   end

   def index_less_than_eq(e, l, r) do
      Enum.find_index(e, &(&1 == l)) <= Enum.find_index(e, &(&1 == r))
   end

end