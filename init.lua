
soundblock = {
  sounds = {}
}

local MP = minetest.get_modpath("soundblock")
dofile(MP.."/api.lua")
dofile(MP.."/form.lua")
dofile(MP.."/digiline.lua")
dofile(MP.."/soundblock.lua")
dofile(MP.."/recipe.lua")

local optional_mods = {"default", "ambience", "doors", "horror", "mobs_monster", "technic"}

for _, m in ipairs(optional_mods) do
  if minetest.get_modpath(m) then
    dofile(MP .. "/mods/" .. m .. ".lua")
  end
end

print("[OK] soundblock")
