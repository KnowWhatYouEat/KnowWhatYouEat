defmodule KWYE.Helpers.Utility do

   def flatten_to_map_by_inner_key(mlist, inner_key) do
      Enum.reduce(mlist, fn(e, acc) -> Map.put acc, e[inner_key], (Map.delete e, inner_key) end)
   end

end
