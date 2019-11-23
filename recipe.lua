

minetest.register_craft({
	output = "soundblock:block",
	recipe = {
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass",      "default:steel_ingot"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
	},
})
