
useless = argument2

argument0.vy = -3;
argument0.vx = argument1 + ((-1)*sign(argument1));
argument0.jumpCount = 10;
argument0.state = argument0.IDLE;
	
FxSleep(1,10);	
FxScreenShake(3,3,5);
instance_destroy();
