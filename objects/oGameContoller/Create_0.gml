/// @description Initiate Match

//Initiate Score
global.game_score[0] = 0
global.game_score[1] = 0

//Spawn Player 1
globalvar player1; globalvar player2;
player1 = instance_create(64,200, oPlayer);
player1.controller = 0;
player1.team = 1;

//Spawn Player 2
player2 = instance_create(590,200, oPlayer);
player2.controller = 1;
player2.team = -1;
player2.targetGoal = oGoalL

//Spawn Ball
alarm[0] = 10;

// Pause Game
//alarm[1] = 60;