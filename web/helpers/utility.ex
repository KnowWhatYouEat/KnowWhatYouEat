defmodule KWYE.Helpers.Utility do

   def flatten_to_map_by_inner_key(mlist, inner_key) do
      for i <- mlist, into: %{}, do: {i[inner_key], (Map.delete i, inner_key)}
   end


end