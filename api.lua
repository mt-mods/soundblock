
--[[
def = {
  filenames = {
    "default_glass_footstep.ogg"
  },
  key = "default_glass_footsteps", -- internal name
  name = "Glass footsteps", -- display name
  length = 13.2 -- length in seconds (optional)
}
--]]

soundblock.register = function(def)
  table.insert(soundblock.sounds, def)
end

minetest.register_on_mods_loaded(function()
  table.sort(soundblock.sounds, function(a, b)
    return a.key < b.key
  end)
end)
