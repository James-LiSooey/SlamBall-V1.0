
if(player2.team != argument0.team){

	if(place_meeting(x,y, player2) and player2.possession){
		DislodgeBall(player2, argument1, argument2);
		
	}else if(place_meeting(x,y, player2)){
		AttackHit(player2, argument1, argument2);
	}
}


if(player1.team != argument0.team){

	if(place_meeting(x,y, player1) and player1.possession){
		DislodgeBall(player1, argument1, argument2);
		
	}else if(place_meeting(x,y, player1)){
		AttackHit(player1, argument1, argument2);
	}
}
