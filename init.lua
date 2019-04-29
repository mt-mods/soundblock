
soundblocks = {
  sounds = {}
}

local MP = minetest.get_modpath("soundblocks")
dofile(MP.."/api.lua")
dofile(MP.."/form.lua")
dofile(MP.."/soundblock.lua")

if minetest.get_modpath("default") then
  dofile(MP.."/builtin.lua")
end


print("[OK] Soundblocks")
