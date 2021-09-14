
if(mouse_check_button_pressed(mb_left) and goatTurn) {
		coordList = movableLocations(mouse_x,mouse_y);
		
	if((coordList[0] <= 16 and coordList[1] <= 16) and 
		(!instance_position( coordList[2], coordList[3], obj_player1)) and 
		 (!instance_position( coordList[2], coordList[3], obj_player2))and 
		(counter<=20) and goatTurn){
		goatI = instance_create_layer(coordList[2], coordList[3], "Player_Layer",obj_player1);
		uloco = getMapLocation(coordList[2], coordList[3]);
		firstTurn = false;
		if (ds_map_find_value(boardMap, uloco) == undefined){
			ds_map_add(boardMap, uloco, goatI);
		}
		counter++;
		goatTurn = false;
		tigerTurn = true;
	}
} 