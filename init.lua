
soundblocks = {
  sounds = {}
}

local MP = minetest.get_modpath("soundblocks")
dofile(MP.."/api.lua")
dofile(MP.."/form.lua")
dofile(MP.."/soundblock.lua")

if minetest.get_modpath("default") then
  dofile(MP.."/mods/builtin.lua")
end

if minetest.get_modpath("technic") then
  dofile(MP.."/mods/technic.lua")
end

if minetest.get_modpath("ambience") then
  dofile(MP.."/mods/ambience.lua")
end


print("[OK] Soundblocks")
