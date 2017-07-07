/// Movement

// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kUp, kDown, kLeftJoyX, kLeftJoyY, kJump, kJumpRelease, kLeap, kLeapRelease, kAction, kShoot, kShootRelease, kShuffle, kRollR, tempAccel, tempFric;

kLeft          = keyboard_check(vk_left)  || gamepad_axis_value(controller, gp_axislh) < -0.4;
kRight         = keyboard_check(vk_right) || gamepad_axis_value(controller, gp_axislh) >  0.4;
kUp            = keyboard_check(vk_up)    || gamepad_axis_value(controller, gp_axislv) < -0.4;
kDown          = keyboard_check(vk_down)  || gamepad_axis_value(controller, gp_axislv) >  0.4;
kLeftJoyX      = gamepad_axis_value(controller, gp_axislh)
kLeftJoyY      = gamepad_axis_value(controller, gp_axislv)

kJump          = keyboard_check_pressed(ord("S"))  || gamepad_button_check_pressed(controller, gp_face1);
kJumpRelease   = keyboard_check_released(ord("S")) || gamepad_button_check_released(controller, gp_face1);
kLeap          = keyboard_check_pressed(ord("C"))  || gamepad_button_check_pressed(controller, gp_face2);
kLeapRelease   = keyboard_check_released(ord("C")) || gamepad_button_check_released(controller, gp_face2);

kAction        = keyboard_check_pressed(ord("W"))  || gamepad_button_check_pressed(controller, gp_face3);
kShoot         = keyboard_check(ord("E"))          || gamepad_button_check(controller, gp_face3);  
kShootRelease  = keyboard_check_released(ord("E")) || gamepad_button_check_released(controller, gp_face3);
kShuffle       = keyboard_check(ord("A"))	       || gamepad_button_check(controller, gp_shoulderlb);
kRollR         = keyboard_check_pressed(ord("D"))  || gamepad_button_check_pressed(controller, gp_shoulderrb);

// Movement ///////////////////////////////////////////////////////////////////

// Get last facing
facingPrev = facing;

// Apply the correct form of acceleration and friction
if (onGround) {
	jumpCount = 0; 
	rollCount = 0; 
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
}

//Handle Gravity
applyGravity();

//Move Horizontally and through platforms
mvBasic(kRight, kLeft, kDown, tempFric, tempAccel);

// Friction
applyFriction(kRight, kLeft, tempFric);
 
//Jump
mvJump(kJump, kJumpRelease, kLeft, kRight);

// Leap 
mvLeap(kLeap, kLeapRelease);

//Blast Special
spBlast(kAction, kLeftJoyX, kLeftJoyY, kUp, kDown, kRight, kLeft);

//shoot
shBasic(kShoot, kShootRelease);

// Roll
mvRoll(kRollR);

// shuffle
if(kShuffle and state != ROLL and state != SHOOTING){
	facing = team;
}
    
/// Squash + stretch
xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);


//need to add facingBeforeRoll
if(state = SHOOTING){
	facing = team;
}else if(!onGround and state != ROLL){
	facing = facingPrev;
}

/* */
/*  */
