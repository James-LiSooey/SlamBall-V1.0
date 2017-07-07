

// Handle gravity
if (!onGround and (state != ROLL)) {
	//fall slower when shooting
    if(state = SHOOTING){
		vy = Approach(vy, vyMax, gravShot);
	// Fall normally
    } else {
        vy = Approach(vy, vyMax, gravNorm);
    }
}

