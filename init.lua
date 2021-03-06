
soundblock = {
  sounds = {}
}

local MP = minetest.get_modpath("soundblock")
dofile(MP.."/api.lua")
dofile(MP.."/form.lua")
dofile(MP.."/digiline.lua")
dofile(MP.."/soundblock.lua")
dofile(MP.."/recipe.lua")

if minetest.get_modpath("default") then
  dofile(MP.."/mods/default.lua")
end

if minetest.get_modpath("horror") then
  dofile(MP.."/mods/horror.lua")
end

if minetest.get_modpath("doors") then
  dofile(MP.."/mods/doors.lua")
end

if minetest.get_modpath("technic") then
  dofile(MP.."/mods/technic.lua")
end

if minetest.get_modpath("ambience") then
  dofile(MP.."/mods/ambience.lua")
end

if minetest.get_modpath("mobs_monster") then
  dofile(MP.."/mods/mobs_monster.lua")
end

print("[OK] soundblock")
