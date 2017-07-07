
kRight = argument0;
kLeft = argument1;
tempFric = argument2;

// Friction
if (!kRight && !kLeft) {
    vx = Approach(vx, 0, tempFric);
    
    if (state != ROLL and state != SHOOTING)
        state = IDLE;
		
} 