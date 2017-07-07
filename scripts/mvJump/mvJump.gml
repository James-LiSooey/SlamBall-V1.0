
//Set input paramaters
kJump = argument0;
kJumpRelease = argument1;
kLeft = argument2;
kRight = argument3;

// Jump 
if (kJump and state!=SHOOTING) {
	//first jump 
    if (onGround) {
        yscale = 1.33;
        xscale = 0.67;
		++jumpCount;
		
		if (kRight) {
			vy = -jumpHeight;
			vx = jumpHeight * .3;
		} else if (kLeft) {
			vy = -jumpHeight;
			vx = -jumpHeight * .3;
		} else {
			vy = -jumpHeight;
		} 
		
	//Double Jump
    }else if(jumpCount<2){
        yscale = 1.33;
        xscale = 0.67;
		++jumpCount;
		
		if (kRight) {
			vy = -jumpHeight;
			vx = jumpHeight * .3;
		} else if (kLeft) {
			vy = -jumpHeight;
			vx = -jumpHeight * .3;
		} else {
			vy = -jumpHeight;
		} 
	}
// Variable jumping
} else if (kJumpRelease and state!=SHOOTING) { 
    if (vy < 0){
        vy *= 0.5;
	}
}

// Jump state
if (!onGround and (state != ROLL) and state != SHOOTING){
    state = JUMP;
}	
	
	
	
	
	
	
	