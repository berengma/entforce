



local function urchin_brain(self)
	
	if not mobkit.is_alive(self) then	
		mobkit.clear_queue_high(self)
		mobkit.hq_die(self)
		return
	end
	
	if mobkit.timer(self,1) then
		minetest.chat_send_all("I am still here")
	end
	
	   
    
end


---------------
-- the Entities
---------------



minetest.register_entity("entforce:ball",{
											-- common props
	physical = true,
	stepheight = 0.5,				
	collide_with_objects = true,
	collisionbox = {-1, -1, -1, 1, 1, 1},
	visual = "mesh",
	mesh = "entforce_ball.b3d",
	textures = {"entforce_ball.png"},
	visual_size = {x = 10, y = 10}, --2.5
	static_save = true,
	makes_footstep_sound = false,
	on_step = mobkit.stepfunc,	-- required
	on_activate = mobkit.actfunc,		-- required
	get_staticdata = mobkit.statfunc,
											-- api props
	springiness=0,
	buoyancy = 1.07,					-- portion of hitbox submerged
	max_speed = 0.2,                     
	jump_height = 0.5,
	view_range = 2,
--	lung_capacity = 0, 		-- seconds
	max_hp = 10,
	timeout=0,
	wild = true,
	attack={range=0.1,damage_groups={fleshy=5}},
	brainfunc = urchin_brain,
	on_punch=function(self, puncher, time_from_last_punch, tool_capabilities, dir)
		if mobkit.is_alive(self) then
						
			mobkit.hurt(self,tool_capabilities.damage_groups.fleshy or 1)

		end
	end,
                                            
    on_rightclick = function(self, clicker)
        if not clicker or not clicker:is_player() then return end
        local inv = clicker:get_inventory()
        local item = clicker:get_wielded_item()
        
        if not item or item:get_name() ~= "fireflies:bug_net" then return end
        if not inv:room_for_item("main", "water_life:urchin_item") then return end
                                            
        inv:add_item("main", "water_life:urchin_item")
        self.object:remove()
    end,
                                            
})



