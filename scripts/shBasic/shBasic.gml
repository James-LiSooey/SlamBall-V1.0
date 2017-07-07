
kShoot = argument0
kShootRelease = argument1

// shot charging
if (kShoot and state!=ROLL and !cancel and !attacking) {
	if(possession){
		shotPower+=2.5;
		facing = team;
		
		//can't move while shooting and apply shooting gravity
		if(state!=SHOOTING){
			vy = 0; 
			vy = Approach(vy, vyMax, gravShot);
			vx = (-1)*team*3;
		}else{
			vx = 0;
		}
		state = SHOOTING;	
	}
}

if(kShootRelease and possession and !attacking){
	if(cancel){
		cancel = false;
		state = IDLE;
		shotPower = 0;
	}else{
		effectpower = (shotPower+shotInitial)/35;
		effectpower = min(effectpower,5);
		state = IDLE;
		possession = false;
		insBall = instance_create(x,y-8,oBall);
		if(shotPower<30){
			vx = (-1)*team*5;
			shotPower = shotInitial + 20;
			insBall.shotPower = shotPower;
			insBall.shotType = 12;
			FxScreenShake(3,3,5);
		}else{
			vx = (-1)*team*(effectpower+1);
			shotPower = shotInitial + shotPower;
			shotPower = min(shotPower,250)
			insBall.shotPower = shotPower;
			insBall.shotType = 14;
			FxScreenShake(effectpower,effectpower,5);
		}
		insBall.targetGoal = targetGoal;
		insBall.shotDirection = team;
		shotPower = 0;
	}
}

if(kShootRelease){
	attacking = false;
}
