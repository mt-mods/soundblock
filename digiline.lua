
soundblock.digiline_rules = {
	-- digilines.rules.default
	{x= 1,y= 0,z= 0},{x=-1,y= 0,z= 0}, -- along x side
	{x= 0,y= 0,z= 1},{x= 0,y= 0,z=-1}, -- along z side
	{x= 1,y= 1,z= 0},{x=-1,y= 1,z= 0}, -- 1 node above along x diagonal
	{x= 0,y= 1,z= 1},{x= 0,y= 1,z=-1}, -- 1 node above along z diagonal
	{x= 1,y=-1,z= 0},{x=-1,y=-1,z= 0}, -- 1 node below along x diagonal
	{x= 0,y=-1,z= 1},{x= 0,y=-1,z=-1}, -- 1 node below along z diagonal
	{x= 0,y= 1,z= 0},{x= 0,y=-1,z= 0}, -- along y above and below
}

function soundblock.digiline_effector(pos, _, channel, msg)
	local msgt = type(msg)
	if msgt ~= "table" then
		return
	end

	if channel ~= "soundblock" then
		return
	end

	if msg.command == "play" then
		-- default position

		local playpos = pos
		if msg.pos then
			-- relative position offset
			playpos = vector.add(pos, {
				x = tonumber(msg.pos.x) or 0,
				y = tonumber(msg.pos.y) or 0,
				z = tonumber(msg.pos.z) or 0
			})
		end

		minetest.sound_play(msg.name, {
			pos = playpos,
			gain = math.min(10, tonumber(msg.gain) or 1),
			max_hear_distance = math.min(32, tonumber(msg.hear_distance) or 10)
		})
	end
end
