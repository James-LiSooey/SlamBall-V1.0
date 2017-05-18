/// @description Insert description here
// You can write your code in this editor

if(player_id != -1){
	EndStepAttachObj(player_id, 0, 0);
}
if(attackFirst){
	alarm[0] = attackTime;

	image_xscale *= attackSizeX
	image_yscale *= attackSizeY;

	attackFirst = false;
}