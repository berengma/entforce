 --chatcommands

minetest.register_chatcommand("forceblock", {
	params = "",
	description = "force load the block at player position",
	privs = {server = true},
	func = function(name, action)
		local player = minetest.get_player_by_name(name)
		if not player then return false end
		local pos = player:get_pos()
		local pstring = minetest.pos_to_string(pos)
		local feed = minetest.forceload_block(pos, true)
		if feed then entforce.block = pos end
		
                                            
		minetest.chat_send_player(name,"Your position: "..dump(pstring).."\n forceloading successful =  "..dump(feed).."\n Setting max forceloaded blocks =  "..dump(entforce.maxblocks))
		
	end
})


minetest.register_chatcommand("freeblock", {
	params = "",
	description = "frees the last forceloaded block",
	privs = {server = true},
	func = function(name, action)
		
		local player = minetest.get_player_by_name(name)
		if not player then return false end
		if not entforce.block then 
			minetest.chat_send_player(name,">>> Nothing to do <<<")
			return
		end
		
		local feed = minetest.forceload_free_block(entforce.block, true)
		
		minetest.chat_send_player(name,"Position: "..dump(minetest.pos_to_string(entforce.block)).." freed\n forceloading successful =  "..dump(feed).."\n")
                                           
		entforce.block = nil
		
	end
                                           
})
