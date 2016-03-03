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

end