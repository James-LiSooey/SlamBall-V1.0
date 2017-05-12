/// attach object to player
if(player_id.possession){
EndStepAttachObj(player_id, 0, (-(player_id.sprite_height/2) - (sprite_height/2)));
}else{
instance_destroy();
}
