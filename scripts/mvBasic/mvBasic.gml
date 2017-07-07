//Set input parameters
kRight = argument0;
kLeft = argument1;
kDown = argument2;
tempFric = argument3;
tempAccel = argument4;

//Move Horizontally
if (state != ROLL and state !=SHOOTING) {
	// Left 
	if (kLeft && !kRight) {
	    facing = -1;
	    state  = RUN;
    
	    // Apply acceleration left
	    if (vx > 0)
	        vx = Approach(vx, 0, tempFric);   
	    vx = Approach(vx, -vxMax, tempAccel);
	// Right
	} else if (kRight && !kLeft) {
	    facing = 1;
	    state  = RUN;
    
	    // Apply acceleration right
	    if (vx < 0)
	        vx = Approach(vx, 0, tempFric);   
	    vx = Approach(vx, vxMax, tempAccel);
	}
}

// Fall thru platform
if (onGround and kDown) {
    if (place_meeting(x, y + 4, oParJumpThru)){
        ++y;
	}
}


