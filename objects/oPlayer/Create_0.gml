/// Variables

// Inherit oParEntity variables
event_inherited();

// Semi States
facing = 1;
jumpCount = 0;
cancel = false;

// Movement ///////////////////////////////////////////////////////////////////

groundAccel = .70;
groundFric  = 1.0;
airAccel    = 0.10;
airFric     = 0.25;
vxMax       = 2.50;
vyMax       = 5.0;
jumpHeight  = 9.00;
gravNorm    = 0.38;
gravSlide   = 0.10; 
gravShot    = 0.03; 
clingTime   = 4.0;


// Misc ///////////////////////////////////////////////////////////////////////

// Shooting ///////////////////////////////////////////////////////////////////////
possession  = false
shotPower   = 0;
shotAngle   = 1;
shotInitial = 70;
//Team 1 shoots right, Team -1 shoots left
team = 1;
if(team==1){
	targetGoal = oGoalR
}else{
	targetGoal = oGoalL
}

// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;
ROLL     = 13;
SHOOTING = 14;
RECOIL   = 15;

// Initialize properties
state  = IDLE;
facing = image_xscale; // Change xscale in editor to adjust initial facing
facingPrev = facing

// For squash + stretch
xscale = 1;
yscale = 1;

///////////////////////////////////////////////////////////////////////////////

attacking = false;
blocking  = false;

//fallTime = 0;
//fallMax  = 28;


