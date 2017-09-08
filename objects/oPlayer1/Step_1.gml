var onGroundPrev = onGround;

onGround = OnGround();

cLeft  = place_meeting(x - 1, y, oBlock); 
cRight = place_meeting(x + 1, y, oBlock);

if (onGround && !onGroundPrev) {
    for (var i = 0; i < 4; ++i) {
        instance_create(x + random_range(-8, 8), y + 8 + random_range(-2, 2), oParticlePlayer);
    }
    
    xscale = 1.33;
    yscale = 0.67;
}

