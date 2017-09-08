// Draw sprite depending on player state
if (!attacking) {
    switch (state) {
        case IDLE: 
            image_speed = 0.2;
            sprite_index = sPlayerIdle;
        break;
        
        case RUN: 
            image_speed = 0.33; 
            sprite_index = sPlayerRun;
			if (random(100) > 85){
				instance_create(x, y + 8, oParticlePlayer);
			}
        break;
        
        case JUMP:
            // Mid jump   
            if (!(place_meeting(x, y + 2, oParSolid) && vy != 0) && vy >= -1.0 && vy <= 1.0) {  
                sprite_index = sPlayerJumpM;  
           } else { 
                // Rise + fall
                if (vy <= 0) {
                    sprite_index = sPlayerJumpU;  
                } else {
                    sprite_index = sPlayerJumpD;
                }
            }
             
        break;
        
        case ROLL:
            // Don't do stuff here    
        break;
		
		case SHOOTING:
			image_speed = 0.33;
			sprite_index = sPlayerIdleShield;
		break;
		
		case RECOIL:
			//dont do stuff
		break;
    }
}


// Draw player
if (onGround)
    draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, 0, c_white, image_alpha);    
else
    draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);

