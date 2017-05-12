/// Variables

// Inherit oParEntity variables
event_inherited();

// Semi States
facing = 1;
jumpCount = 0;

// Movement ///////////////////////////////////////////////////////////////////

groundAccel = .50;
groundFric  = 1.00;
airAccel    = 0.38;
airFric     = 0.25;
vxMax       = 2.50;
vyMax       = 5.0;
jumpHeight  = 9.00;
gravNorm    = 0.38;
gravSlide   = 0.10; 
clingTime   = 4.0;


// Misc ///////////////////////////////////////////////////////////////////////

// Shooting ///////////////////////////////////////////////////////////////////////
possession = false
shotPower = 0;
shotAngle = 1;
//Team 1 shoots right, Team -1 shoots left
team = 1;
if(team==1){
	targetGoal = oGoalR
}else{
	//goalLocation = oGoalL
}


// States
IDLE     = 10;
RUN      = 11;
JUMP     = 12;
ROLL     = 13;
SHOOTING = 14

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


