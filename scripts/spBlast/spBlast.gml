
kAction = argument0
kLeftJoyX = argument1
kLeftJoyY = argument2
kUp = argument3
kDown = argument4
kRight = argument5
kLeft = argument6

//attack
if (kAction and state!=ROLL and !possession and !attacking and canAttack) {
	attacking = true;
	canAttack = false;
	FxScreenShake(2,2,5);
	ins_attack = instance_create(x, y, oPlayerAtkMask);
	ins_attack.player_id = id;
	ins_attack.attackTime = 20;
	ins_attack.attackSizeX = 2.5;
	ins_attack.attackSizeY = 2.5;
	vx = 0;
	vy = 0;
	
	if(abs(kLeftJoyX)>.4 or abs(kLeftJoyY)>.4){
		ins_attack.acc_y = 6 * (kLeftJoyY/(abs(kLeftJoyX) + abs(kLeftJoyY)));
		ins_attack.acc_x = 6 * (kLeftJoyX/(abs(kLeftJoyX) + abs(kLeftJoyY)));
	}else if(kUp){
		ins_attack.acc_y = -6;
	}else if(kDown){
		ins_attack.acc_y = 6;
		vy = -2*sign(ins_attack.acc_y);
	}else if(kRight){
		ins_attack.acc_x = 6;
	}else if(kLeft){
		ins_attack.acc_x = -6;
	}else{
		ins_attack.acc_x = (facing)*6;
	}
	
	vx = -2*sign(ins_attack.acc_x);
	
}