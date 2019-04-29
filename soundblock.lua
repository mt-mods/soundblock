
-- minetest.sound_play("vacuum_hiss", {pos = pos, gain = 0.5, max_hear_distance=16})
-- 	local timer = minetest.get_node_timer(pos)
-- 	   timer:start(3)


minetest.register_node("soundblocks:block", {
	description = "Sound Block",
	tiles = {"soundblocks_block.png"},
	is_ground_content = false,
	groups = { oddly_breakable_by_hand = 1 },

  on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("selected_sound_key", "")
	end,

  can_dig = function(pos,player)
		if player and player:is_player() and minetest.is_protected(pos, player:get_player_name()) then
			-- protected
			return false
		end

    return true
	end,

  on_timer = function(pos, elapsed)
    --TODO
  end,

  mesecons = {effector = {
    action_on = function (pos, node)
      local meta = minetest.get_meta(pos)
      --TODO
      update_infotext(meta)
    end,
    action_off = function (pos, node)
      local meta = minetest.get_meta(pos)
      --TODO
      update_infotext(meta)
    end
  }},

  on_rightclick = soundblocks.showform
})


minetest.register_craft({
	output = "soundblocks:block",
	recipe = {
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass",      "default:steel_ingot"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
	},
})
