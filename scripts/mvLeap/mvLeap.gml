kLeap = argument0;
kLeapRelease = argument1;

// Leap 
if (kLeap and !possession and jumpCount<3) {
	//first jump 
    yscale = 1.33;
    xscale = 0.67;
	jumpCount = 10;
		
	vy = -LeapHeight;
	vx = (facing)*LeapWidth;
// Variable leaping
} else if (kLeapRelease) { 
    if (vy < 0){
        vy *= 0.75;
	}
}



