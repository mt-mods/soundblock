
soundblock = {
  sounds = {}
}

local MP = minetest.get_modpath("soundblock")
dofile(MP.."/api.lua")
dofile(MP.."/form.lua")
dofile(MP.."/soundblock.lua")

if minetest.get_modpath("default") then
  dofile(MP.."/mods/default.lua")
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
