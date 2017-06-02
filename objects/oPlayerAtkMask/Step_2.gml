/// @description Insert description here
// You can write your code in this editor

if(player_id != -1){
	//EndStepAttachObj(player_id, speedx, speedy);
	x+=acc_x;
	y+=acc_y;
}
if(attackFirst){
	alarm[0] = attackTime;
	alarm[1] = 1;
	
	attackFirst = false;
}



