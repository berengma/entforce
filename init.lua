entforce = {}
entforce.blocks = {}

entforce.maxblocks = tonumber(minetest.settings:get("max_forceloaded_blocks")) or 16

local path = minetest.get_modpath(minetest.get_current_modname())


dofile(path.."/ball.lua")               											
dofile(path.."/chatcommands.lua")													
