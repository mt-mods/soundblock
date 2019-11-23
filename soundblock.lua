
local played_sound_cache = {}

local stop_sound = function(pos)
	local hash = minetest.hash_node_position(pos)
	if played_sound_cache[hash] then
		minetest.sound_stop(played_sound_cache[hash])
		played_sound_cache[hash] = nil
	end
end

local execute = function(pos)
	local meta = minetest.get_meta(pos)

	stop_sound(pos)

	local selected_sound_key = meta:get_string("selected_sound_key")
	local def

	for _, sounddef in ipairs(soundblock.sounds) do
		if sounddef.key == selected_sound_key then
			def = sounddef
		end
	end

	if def == nil then
		return
	end

	local gain = meta:get_int("gain")
	local hear_distance = meta:get_int("hear_distance")
	local randomize_position = meta:get_int("randomize_position")
	local play_pos = pos

	local filename = def.filename

	if def.filenames then
		filename = def.filenames[math.random(1, #def.filenames)]
	end

	if randomize_position > 0 then
		play_pos = vector.add(pos, {
			x = math.random(-randomize_position, randomize_position),
			y = math.random(-randomize_position, randomize_position),
			z = math.random(-randomize_position, randomize_position)
		})
	end

	local handle = minetest.sound_play(filename, {
		pos = play_pos,
		gain = gain,
		max_hear_distance = hear_distance
	})

	local hash = minetest.hash_node_position(pos)
	played_sound_cache[hash] = handle

end

minetest.register_node("soundblock:block", {
	description = "Sound Block",
	tiles = {"soundblock_block.png"},
	is_ground_content = false,
	groups = { oddly_breakable_by_hand = 1 },

  on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("selected_sound_key", "default_grass_footstep")
		meta:set_string("state", "off")
		meta:set_int("interval_min", 2)
		meta:set_int("interval_max", 2)
		meta:set_int("gain", 1)
		meta:set_int("hear_distance", 32)
		meta:set_int("randomize_position", 0)
	end,

  on_timer = function(pos)
		local meta = minetest.get_meta(pos)
		local state = meta:get_string("state")

		if state ~= "on" then
			stop_sound(pos)
			return
		end

		execute(pos)

		local interval_min = meta:get_int("interval_min")
		local interval_max = meta:get_int("interval_max")

		local new_timeout = math.random(interval_min, interval_max)

		local timer = minetest.get_node_timer(pos)
		timer:start(new_timeout)
  end,

  mesecons = {
			effector = {
	    action_on = function (pos)
				execute(pos)
	    end,
			action_off = function(pos)
				stop_sound(pos)
			end
	  }
	},

  on_rightclick = soundblock.showform
})


minetest.register_craft({
	output = "soundblock:block",
	recipe = {
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass",      "default:steel_ingot"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
	},
})
