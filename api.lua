
--[[
def = {
  filenames = {
    "default_glass_footstep.ogg"
  },
  key = "default_glass_footsteps", -- internal name
  name = "Glass footsteps" -- display name
}
--]]

soundblock.register = function(def)
  soundblock.sounds[def.key] = def
end
