
temp = false;

if (grabbed == false) {
	exit;
}
else if(tigerTurn == true){
	xd = mouse_x + xx;
	yd = mouse_y + yy;
	
	coordList = movableLocations(xd,yd);
	originList = movableLocations(originX, originY);
	
	if((!instance_position( coordList[2], coordList[3], obj_player2)) and (!instance_position( coordList[2], coordList[3], obj_player1))) {
			position_destination = getMapLocation(coordList[2], coordList[3]);
			position_origin = getMapLocation(originList[2], originList[3]);
			
			jumpList =  getMoveListTiger(position_origin);
			
			if (ds_list_find_index(jumpList, position_destination) >= 0) {
				x = coordList[2]; 
				y = coordList[3];
				temp = true;
				
			}
			if(temp == false) {
				x = originX;
				y = originY;
			}
	}
}

