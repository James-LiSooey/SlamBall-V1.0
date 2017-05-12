//player collect ball
if(place_meeting(x,y,oPlayer)){
	
	playerInst = instance_nearest(x,y,oPlayer);
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

	shotX = targetGoal.x - x;
	shotY = targetGoal.y-16 - y;
	shotTotal = abs(shotX) + abs(shotY);
	shotX = shotX/shotTotal;
	shotY = shotY/shotTotal;

	switch(shotType){
		case STANDARD: 
			physics_apply_impulse(x,y,shotPower*shotDirection,(-1*shotPower) -40);
		break;
		case QUICK: 
			physics_world_gravity(0,0);
			physics_apply_impulse(x,y,shotX*shotDirection*80,shotY*80);
			alarm[1] = 15;
		break;
		
	}



	shotPower = 0;
	alarm[0] = 180;
}