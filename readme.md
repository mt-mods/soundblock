
A soundblock that emits sounds with given interval or per mesecon signal

## Api

Register custom sounds:

```lua
soundblocks.register({
  filename = "default_glass_footstep.ogg",
  key = "default_glass_footsteps",
  name = "Glass footsteps"
})


soundblocks.register({
  filenames = {
    "default_grass_footstep.1.ogg",
    "default_grass_footstep.2.ogg",
    "default_grass_footstep.3.ogg"
  },
  key = "default_grass_footstep",
  name = "Grass footsteps"
})

```

# Digiline api

```lua
if event.type == "program" then
 digiline_send("soundblock", {
  command = "play",
	name = "default_grass_footstep.1.ogg",
	-- relative position (optional)
	pos = { x=0, y=10, z=0 },
	-- gain, defaults to 1
	gain = 1,
	-- max_hear_distance, defaults to 10
	hear_distance = 32
 })
end
```

# License

See `license.txt`

## textures/soundblock_block.png

* DWYWPL
* https://github.com/minetest-mods/mysoundblocks
