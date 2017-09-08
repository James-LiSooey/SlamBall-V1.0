
kRollR = argument0
kRollL = argument1

// Roll
//if (onGround && !attacking) {
if (!attacking and state != ROLL and (kRollR or kRollL) and rollCount<2) {
	if(!onGround){
		rollCount++;
	}
	if(kLeft || kRight){
		facing = 1 - (kLeft*2);
    }else{
		facing = facingPrev;
	}	
	
	if(kRollL){
		rollDir = -1;
	}			
			
	//add screenshake for roll duration (14 frames)
	if(onGround){
		FxScreenShake(0,1,14);
		image_speed  = .5;
	}else{
		FxScreenShake(0,1,5);
		image_speed  = 1;
	}
    image_index  = 0;
    
    sprite_index = sPlayerRoll;
    if(state = SHOOTING){
		cancel = true;
	}						
    state = ROLL;
}

// Roll speed
if (state == ROLL) {
	if(onGround){
		vx = rollDir * RollSpeed;
	}else{
		vx = rollDir * RollSpeed;
	}
    vy = 0;

	if ((cLeft || cRight)) {
        state = IDLE;
        if (!attacking){
            alarm[1] = -1;
		}
    }
}else{
	rollDir = 1;
}
