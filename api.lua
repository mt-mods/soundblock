
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
  soundblock.sounds[def.key] = def
end
