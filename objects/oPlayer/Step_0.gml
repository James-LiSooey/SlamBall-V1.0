/// Movement

// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kAction, kShoot, kShootRelease, kBlock, kShuffle, kRollR, tempAccel, tempFric;

kLeft          = keyboard_check(vk_left)  || gamepad_axis_value(0, gp_axislh) < -0.4;
kRight         = keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) >  0.4;
kUp            = keyboard_check(vk_up)    || gamepad_axis_value(0, gp_axislv) < -0.4;
kDown          = keyboard_check(vk_down)  || gamepad_axis_value(0, gp_axislv) >  0.4;

kJump          = keyboard_check_pressed(ord("S"))  || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease   = keyboard_check_released(ord("S")) || gamepad_button_check_released(0, gp_face1);

kAction        = keyboard_check_pressed(ord("X"))  || gamepad_button_check_pressed(0, gp_face3);
kShoot         = keyboard_check(ord("E"))          || gamepad_button_check(0, gp_face4);  
kShootRelease  = keyboard_check_released(ord("E")) || gamepad_button_check_released(0, gp_face4);
kBlock         = keyboard_check(ord("C"))          || gamepad_button_check(0, gp_face2);
kShuffle       = keyboard_check(ord("A"))  || gamepad_button_check_pressed(0, gp_shoulderlb);
kRollR         = keyboard_check_pressed(ord("D"))  || gamepad_button_check_pressed(0, gp_shoulderrb);

// Movement ///////////////////////////////////////////////////////////////////

// Get last facing
facingPrev = facing;

// Apply the correct form of acceleration and friction
if (onGround) {
	jumpCount = 0;  
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
}

// Reset wall cling
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
}   

// Cling to wall
if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true; 
    canStick = false;
	jumpCount = 0;       
}

// Handle gravity
if (!onGround and (state != ROLL)) {
    if(state = SHOOTING){
		vy = Approach(vy, vyMax, gravShot);
	}else if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
    }
}

if (state != ROLL and state !=SHOOTING) {
// Left 
if (kLeft && !kRight && !sticking) {
    facing = -1;
    state  = RUN;
    
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, -vxMax, tempAccel);
// Right
} else if (kRight && !kLeft && !sticking) {
    facing = 1;
    state  = RUN;
    
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, vxMax, tempAccel);
}
}

// Friction
if (!kRight && !kLeft) {
    vx = Approach(vx, 0, tempFric);
    
    if (state != ROLL and state != SHOOTING)
        state = IDLE;
} 
       
// Wall jump
if (kJump && cLeft && !onGround) {
    yscale = 1.33;
    xscale = 0.67;
	++jumpCount;
            
    if (kLeft) {
        vy = -jumpHeight * 1.2;
        vx =  jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx =  vxMax; 
    }  
}

if (kJump && cRight && !onGround) {
    yscale = 1.33;
    xscale = 0.67;
	++jumpCount;
    
    if (kRight) {
        vy = -jumpHeight * 1.2;
        vx = -jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx = -vxMax;
    }  
}
 
// Jump 
if (kJump) {
	//first jump 
    if (onGround) {
        yscale = 1.33;
        xscale = 0.67;
		++jumpCount;
		
		if (kRight) {
			vy = -jumpHeight;
			vx = jumpHeight * .5;
		} else if (kLeft) {
			vy = -jumpHeight;
			vx = -jumpHeight * .5;
		} else {
			vy = -jumpHeight;
		} 
		
	//Double Jump
    }else if(jumpCount<2){
        yscale = 1.33;
        xscale = 0.67;
		++jumpCount;
		
		if (kRight) {
			vy = -jumpHeight;
			vx = jumpHeight * .5;
		} else if (kLeft) {
			vy = -jumpHeight;
			vx = -jumpHeight * .5;
		} else {
			vy = -jumpHeight;
		} 
	}
// Variable jumping
} else if (kJumpRelease) { 
    if (vy < 0){
        vy *= 0.5;
	}
}

if (onGround) {
        // Fall thru platform
    if (kDown) {
        if (place_meeting(x, y + 4, oParJumpThru)){
            ++y;
		}
	}
}

// Jump state
if (!onGround and (state != ROLL) and state != SHOOTING)
    state = JUMP;
// Run particles
else if (random(100) > 85 && abs(vx) > 0.5)
    instance_create(x, y + 8, oParticlePlayer);

// Swap facing during wall slide
if (cRight && !onGround && (state!=ROLL)and state != SHOOTING)
    facing = -1;
else if (cLeft && !onGround && (state!=ROLL)and state != SHOOTING)
    facing = 1;

// shot charging
if (!kBlock and kShoot and state!=ROLL and !cancel) {
	if(possession){
		//increase shotpower
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
		//vy = Approach(vy, vyMax, gravShot); vx = 0;	
	}
}


// Roll
//if (onGround && !attacking) {
if (!attacking) {
    if (state != ROLL) {
        /*if (kRollL) {
            facing = -1;
            
            image_index  = 0;
            image_speed  = 0.5;
            sprite_index = sPlayerRoll;
            
            state = ROLL;
        } else*/ 
		if (kRollR) {
			if(kLeft || kRight){
				facing = 1 - (kLeft*2);
            }else{
				facing = facingPrev;
			}				
			
			//add screenshake for roll duration (14 frames)
			if(onGround){
				effects_ScreenShake(0,1,14);
			}else{
				effects_ScreenShake(0,1,5);
			}
            image_index  = 0;
            image_speed  = 0.5;
            sprite_index = sPlayerRoll;
            if(state = SHOOTING){
				cancel = true;
			}			
			
            state = ROLL;
        }
    }
}

// Roll speed
if (state == ROLL) {
    vx = facing * 6;
    vy = 0;
    // Break out of roll
        //if (!onGround || (cLeft || cRight)) {
	if ((cLeft || cRight)) {
        state = IDLE;
        if (!attacking){
            alarm[1] = -1;
		}
    }
}

// shuffle
if(kShuffle and state != ROLL and state != SHOOTING){
	facing = team;
}
    


//Shoot Ball
if(kShootRelease and possession){
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
			effects_ScreenShake(3,3,5);
		}else{
			vx = (-1)*team*(effectpower+1);
			shotPower = shotInitial + shotPower;
			shotPower = min(shotPower,250)
			insBall.shotPower = shotPower;
			insBall.shotType = 14;
			effects_ScreenShake(effectpower,effectpower,5);
		}
		insBall.targetGoal = targetGoal;
		insBall.shotDirection = team;
		shotPower = 0;
	}
}

blocking = kBlock;

/* */
/// Squash + stretch
xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

/* */
/// Hitbox

with (oPlayerAtkBox)
    instance_destroy();

// Dash out of roll
if (sprite_index == sPlayerRollSlash) {    
    with (instance_create(x, y, oPlayerAtkBox)) {
        bboxleft  = min(other.x + (5 * other.facing), other.x + (24 * other.facing));
        bboxright = max(other.x + (5 * other.facing), other.x + (24 * other.facing));
        
        bboxtop    = other.y - 1;
        bboxbottom = other.y + 8; 
    }
}
    
// Jab
if (sprite_index == sPlayerJab && round(image_index) > 0) {    
    with (instance_create(x, y, oPlayerAtkBox)) {
        bboxleft  = min(other.x + (5 * other.facing), other.x + (30 * other.facing));
        bboxright = max(other.x + (5 * other.facing), other.x + (30 * other.facing));
        
        bboxtop    = other.y - 1;
        bboxbottom = other.y + 8; 
    }
}

//need to add facingBeforeRoll
if(state = SHOOTING){
	facing = team;
}else if(!onGround and state != ROLL){
	facing = facingPrev;
}

/* */
/*  */
