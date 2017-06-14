

	argument0.possession = false;
	argument0.vy = -3
	argument0.vx = argument1 + ((-1)*sign(argument1));
	argument0.jumpCount = 10;
		
	insBall = instance_create(argument0.x,argument0.y-8,oBall);
	insBall.shotPower = 65;
	insBall.shotType = 15;
	insBall.shotDirection = 1;
	insBall.dislodgex = argument1;
	insBall.dislodgey = argument2;
	
	FxSleep(1,10)
	FxScreenShake(3,3,5);
	instance_destroy();