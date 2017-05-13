/// @description Collision with Goal
// You can write your code in this editor

if(place_meeting(x,y,oParGoal)){
	ins_Goal = instance_nearest(x,y,oParGoal);
	global.game_score[(ins_Goal.team+1)/2] += 1;
	oGameContoller.alarm[0] = 30;

	instance_destroy()
}


