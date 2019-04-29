
local FORMNAME = "soundblock_config"

--[[
config options:
* mesecon-behavior: [repeat, single]
* state: [off, mesecon, on]

* interval-from <float>
* interval-to <float>

* gain <float>
* hear-distance <int>
* randomize-position <int> 0...64

--]]


soundblocks.showform = function(pos, node, player)

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")
	local has_override = minetest.check_player_privs(player, "protection_bypass")

	-- check if plain user rightclicks
	if player:get_player_name() ~= owner and not has_override then
		return
	end

	local selected_sound_key = meta:get_string("selected_sound_key")
	local selected_sound = 0

	-- sound list
	local sound_list = "textlist[0,1;5,6;sounds;"
	for i,sound in ipairs(soundblocks.sounds) do
		if selected_sound_key == sound.key then
			selected_sound = i
		end

		sound_list = sound_list .. i .. ": " .. minetest.formspec_escape(sound.name)
		if i < #soundblocks.sounds then
			sound_list = sound_list .. ","
		end
	end
	sound_list = sound_list .. ";" .. selected_sound .. "]";

	local formspec = "size[8,8;]" ..
		--left
		"label[0,0;Mission editor]" ..
		"button[5.5,1;2,1;add;Add]" ..
		"button[5.5,2;2,1;edit;Edit]" ..
		"button[5.5,3;2,1;up;Up]" ..
		"button[5.5,4;2,1;down;Down]" ..
		"button[5.5,5;2,1;remove;Remove]" ..
		steps_list ..
		"button_exit[0,7;8,1;save;Save and validate]"

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
	local node = minetest.get_node(pos)
  local has_override = minetest.check_player_privs(player, "protection_bypass")

	if not has_override and minetest.is_protected(pos, player:get_player_name()) then
		return
	end

	if fields.sounds then
		parts = fields.steps:split(":")
		if parts[1] == "CHG" then
			local selected_sound = tonumber(parts[2])
			--TODO
		end
	end

  --TODO


end)
