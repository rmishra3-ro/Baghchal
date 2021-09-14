grabbed = false;

if (checkThisInSecondArray(position_origin, position_destination)) {
	desIns = true;
}

show_debug_message(string(position_destination) + "Destination" + string(desIns));

if(position_origin == position_destination and firstTurn == false) {
	show_message("Origin Position. Move Somewhere Else");
	tigerTurn = true;
	goatTurn = false;
}
else if (position_origin == position_destination and firstTurn == true) {
	show_message("NOT YOUR TURN");
} else if (desIns == true and position_destination != position_origin){
	destroyPos = getJumpedGoatPosition(position_origin, position_destination);
	instance_destroy(ds_map_find_value(boardMap, destroyPos));
	ds_map_delete(boardMap, destroyPos);
	goatsKilled++;
	
	if(goatsKilled >=5) {
		//copyright sound:  http://www.blight.com/~ja-wells/sounds/growl.wav
		audio_play_sound(Sound_tiger_roar,1,false);
		room_goto(WinRoom_Tiger);
	}
	
	destroyInstance = 0;
	instance = 0;
	tigerTurn = false;
	goatTurn = true;
	desIns = false;
	moveTiger(position_origin, position_destination);
	show_debug_message(string(ds_map_size(boardMap)) + " TIGERS EAT");
	
} else if (position_origin != position_destination){
	tigerTurn = false;
	goatTurn = true;
	moveTiger(position_origin, position_destination);
}

