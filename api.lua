
--[[
def = {
  filenames = {
    "default_glass_footstep.ogg"
  },
  key = "default_glass_footsteps", -- internal name
  name = "Glass footsteps" -- display name
}
--]]

soundblocks.register = function(def)
  soundblocks.sounds[def.key] = def
end
