//player collect ball
if(place_meeting(x,y,oPlayer) and collectible){
	
	playerInst = instance_nearest(x,y,oPlayer);
	playerInst.possession = true;
	instPostMarker = instance_create(playerInst.x,playerInst.y-playerInst.sprite_height,oPosMarker);
	instPostMarker.player_id = playerInst;
	phy_linear_velocity_x = 0;
	phy_linear_velocity_y = 0;
	phy_active = false
	
	instance_destroy();
}

//collision with playerattack
if(place_meeting(x,y,oPlayerAtkMask) and collectible){
	
	effects_ScreenShake(1,1,5);
	playerAtkInst = instance_nearest(x,y,oPlayerAtkMask);
	playerInst = playerAtkInst.player_id;
	playerInst.possession = true;
	instPostMarker = instance_create(playerInst.x,playerInst.y-playerInst.sprite_height,oPosMarker);
	instPostMarker.player_id = playerInst;
	phy_linear_velocity_x = 0;
	phy_linear_velocity_y = 0;
	phy_active = false
	
	instance_destroy();
}

//Shoot Ball
if(shotPower>0){

	

	switch(shotType){
		case ARC: 
			physics_apply_impulse(x,y,shotPower*shotDirection,(-1*shotPower) -40);
		break;
		case QUICK: 
			shotX = targetGoal.x - x;
			shotY = targetGoal.y-16 - y;
			shotTotal = abs(shotX) + abs(shotY);
			shotX = shotX/shotTotal;
			shotY = shotY/shotTotal;
			physics_world_gravity(0,0);
			physics_apply_impulse(x,y,shotX*shotPower,shotY*shotPower);
			alarm[1] = shotPower/6;
		break;
		case DIRECT: 
			shotX = targetGoal.x - x;
			shotY = targetGoal.y-16 - y;
			shotTotal = abs(shotX) + abs(shotY);
			shotX = shotX/shotTotal;
			shotY = shotY/shotTotal;
			physics_world_gravity(0,5);
			physics_apply_impulse(x,y,shotX*shotPower,shotY*shotPower);
			alarm[1] = shotPower/6;
		break;
		case DISLODGED: 
			physics_world_gravity(0,5);
			physics_apply_impulse(x,y,dislodgex*5,-shotPower);
			alarm[1] = shotPower/6;
		break;
	}
	shotPower = 0;
	alarm[0] = 180;
}