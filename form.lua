
local FORMNAME = "soundblock_config"

--[[
config options:
* state: [off, on]

* interval-min <float>
* interval-max <float>

* gain <float>
* hear-distance <int>
* randomize-position <int> 0...64

--]]

soundblock.showform = function(pos, _, player)

	local meta = minetest.get_meta(pos)
	local has_override = minetest.check_player_privs(player, "protection_bypass")

	-- check if plain user rightclicks
	if minetest.is_protected(pos, player:get_player_name()) and not has_override then
		return
	end

	local selected_sound_key = meta:get_string("selected_sound_key")
	local selected_id = 1
	local i = 1

	-- sound list
	local sound_list = "textlist[0,1;4,6;sounds;"

	for key, sound in pairs(soundblock.sounds) do
		if selected_sound_key == key then
			selected_id = i
		end

		i = i + 1
		sound_list = sound_list .. minetest.formspec_escape(sound.name) .. ","
	end
	sound_list = sound_list:sub(1, #sound_list-1)
	sound_list = sound_list .. ";" .. selected_id .. "]";

	local state = meta:get_string("state")
	local interval_min = meta:get_int("interval_min")
	local interval_max = meta:get_int("interval_max")
	local gain = meta:get_int("gain")
	local hear_distance = meta:get_int("hear_distance")
	local randomize_position = meta:get_int("randomize_position")

	local formspec = "size[8,8;]" ..
		--left
		"label[0,0;Soundblock <" .. state .. ">]" ..

		"field[5,1;3,1;interval_min;Interval-min;" .. interval_min ..  "]" ..
		"field[5,2;3,1;interval_max;Interval-max;" .. interval_max ..  "]" ..

		"field[5,3;3,1;gain;Gain;" .. gain ..  "]" ..
		"field[5,4;3,1;hear_distance;Hear distance;" .. hear_distance ..  "]" ..
		"field[5,5;3,1;randomize_position;Randomize position;" .. randomize_position ..  "]" ..

		sound_list ..
		"button_exit[0,7;4,1;save;Save]" ..
		"button_exit[4,7;4,1;toggle_state;Toggle state]"

	minetest.show_formspec(player:get_player_name(),
		FORMNAME .. ";" .. minetest.pos_to_string(pos),
		formspec
	)

end



minetest.register_on_player_receive_fields(function(player, formname, fields)
	local parts = formname:split(";")
	local name = parts[1]
	if name ~= FORMNAME then
		return
	end

	local pos = minetest.string_to_pos(parts[2])
	local meta = minetest.get_meta(pos)
  local has_override = minetest.check_player_privs(player, "protection_bypass")

	if not has_override and minetest.is_protected(pos, player:get_player_name()) then
		return
	end

	local timer = minetest.get_node_timer(pos)
	if fields.toggle_state then
		local state = meta:get_string("state")
		if state == "on" then
			state = "mesecons"
			timer:stop()

		elseif state == "mesecons" then
			state = "off"
			timer:stop()

		else -- off
			state = "on"
			timer:start(0)

		end

		meta:set_string("state", state)
	end

	if fields.toggle_state or fields.save then
		meta:set_int("interval_min", tonumber(fields.interval_min) or 1)
		meta:set_int("interval_max", tonumber(fields.interval_max) or 1)
		meta:set_int("gain", tonumber(fields.gain) or 1)
		meta:set_int("hear_distance", math.min(tonumber(fields.hear_distance) or 16, 64))
		meta:set_int("randomize_position", tonumber(fields.randomize_position) or 0)
	end

	if fields.sounds then
		parts = fields.sounds:split(":")
		if parts[1] == "CHG" then
			local selected_id = tonumber(parts[2])
			local i = 1
			local selected_sound_key

			for key in pairs(soundblock.sounds) do
				if selected_id == i then
					selected_sound_key = key
				end

				i = i + 1
			end

			meta:set_string("selected_sound_key", selected_sound_key)
			local sounddef = soundblock.sounds[selected_sound_key]
			if sounddef and sounddef.length then
				meta:set_int("interval_min", sounddef.length)
				meta:set_int("interval_max", sounddef.length)
				soundblock.showform(pos, nil, player)
			end
		end
	end

end)
