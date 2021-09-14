// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dataScript() 
{
	movementMap = ds_map_create();
	ds_map_add(movementMap, 1, [0,0,0,2,7,6,0,0]);
	ds_map_add(movementMap, 2, [0,0,0,3,0,7,0,1]);
	ds_map_add(movementMap, 3, [0,0,0,4,9,8,7,2]);
	ds_map_add(movementMap, 4, [0,0,0,5,0,9,0,3]);
	ds_map_add(movementMap, 5, [0,0,0,0,0,10,9,4]);
	ds_map_add(movementMap, 6, [0,1,0,7,0,11,0,0]);
	ds_map_add(movementMap, 7, [1,2,3,8,13,12,11,6]);
	ds_map_add(movementMap, 8, [0,3,0,9,0,13,0,7]);
	ds_map_add(movementMap, 9, [3,4,5,10,15,14,13,8]);
	ds_map_add(movementMap, 10, [0,5,0,0,0,15,0,9]);
	ds_map_add(movementMap, 11, [0,6,7,12,17,16,0]);
	ds_map_add(movementMap, 12, [0,7,0,13,0,17,0,11]);
	ds_map_add(movementMap, 13, [7,8,9,14, 19,18,17,12]);
	ds_map_add(movementMap, 14, [0,9,0,15,0,19,0,13]);
	ds_map_add(movementMap, 15, [9,10,0,0,0,20,19,14]);
	ds_map_add(movementMap, 16, [0,11,0,17,0,21,0,0]);
	ds_map_add(movementMap, 17, [11,12,13,18,23,22,21,16]);
	ds_map_add(movementMap, 18, [0,13,0,19,0,23,0,17]);
	ds_map_add(movementMap, 19, [13,14,15,20,25,24,23,18]);
	ds_map_add(movementMap, 20, [0,15,0,0,0,25,0,19]);
	ds_map_add(movementMap, 21, [0,16,17,22,0,0,0,0]);
	ds_map_add(movementMap, 22, [0,17,0,23,0,0,0,21]);
	ds_map_add(movementMap, 23, [17,18,19,24,0,0,0,22]);
	ds_map_add(movementMap, 24, [0,19,0,25,0,0,0,23]);
	ds_map_add(movementMap, 25, [19,20,0,0,0,0,0,24]);
	return movementMap;
}


/**
Data script for if goat exists in dataScript().
**/
function TwoStepdataScript() 
{
	moveMap = ds_map_create();
	ds_map_add(moveMap, 1, [0,0,0,3,13,11,0,0]);
	ds_map_add(moveMap, 2, [0,0,0,4,0,12,0,0]);
	ds_map_add(moveMap, 3, [0,0,0,5,15,13,11,1]);
	ds_map_add(moveMap, 4, [0,0,0,0,0,14,0,2]);
	ds_map_add(moveMap, 5, [0,0,0,0,0,15,13,3]);
	ds_map_add(moveMap, 6, [0,0,0,8,0,16,0,0]);
	ds_map_add(moveMap, 7, [0,0,0,9,19,17,0,0]);
	ds_map_add(moveMap, 8, [0,0,0,10,0,18,0,6]);
	ds_map_add(moveMap, 9, [0,0,0,0,0,19,17,7]);
	ds_map_add(moveMap, 10, [0,0,0,0,0,20,0,8]);
	ds_map_add(moveMap, 11, [0,1,3,13,23,21,0]);
	ds_map_add(moveMap, 12, [0,2,0,14,0,22,0,0]);
	ds_map_add(moveMap, 13, [1,3,5,15,25,23,21,11]);
	ds_map_add(moveMap, 14, [0,4,0,0,0,24,0,12]);
	ds_map_add(moveMap, 15, [3,5,0,0,0,25,23,13]);
	ds_map_add(moveMap, 16, [0,6,0,18,0,0,0,0]);
	ds_map_add(moveMap, 17, [0,7,9,19,0,0,0,0]);
	ds_map_add(moveMap, 18, [0,8,0,20,0,0,0,16]);
	ds_map_add(moveMap, 19, [7,9,0,0,0,0,0,17]);
	ds_map_add(moveMap, 20, [0,10,0,0,0,0,0,18]);
	ds_map_add(moveMap, 21, [0,11,13,23,0,0,0,0]);
	ds_map_add(moveMap, 22, [0,12,0,24,0,0,0,0]);
	ds_map_add(moveMap, 23, [11,13,15,25,0,0,0,21]);
	ds_map_add(moveMap, 24, [0,14,0,0,0,0,0,22]);
	ds_map_add(moveMap, 25, [13,15,0,0,0,0,0,23]);
	return moveMap;
}

function checkThisInSecondArray(checkOriginPos, checkDestPos){
	map = TwoStepdataScript();
	checkList = ds_map_find_value(map, checkOriginPos);
	for (checkPos = 0; checkPos < array_length_1d(checkList); checkPos++) {
		if (checkList[checkPos] == checkDestPos) {
			return true;	
		}
	}
	return false;
}

function changeTurn() {
	if (tigerTurn == false and goatTurn == true) {
		tigerTurn = true;
		goatTurn = false;
	} else {
		tigerTurn = false;
		goatTurn = true;
	}
}

function moveTiger(origin, destination) {
	tins = ds_map_find_value(boardMap, origin);
	ds_map_delete(boardMap, origin);
	ds_map_add(boardMap, destination, tins);
}

function getJumpedGoatPosition(originG, destinationG) {
	return (originG + destinationG)/2;
}

function getMoveListTiger(originalPosition) {
	ds_list_clear(moveList);
	firstMovement = dataScript();
	secondMovement = TwoStepdataScript();
	
	//boardMap
	arrayfirst = ds_map_find_value(firstMovement, originalPosition);
	for (i = 0; i < array_length_1d(arrayfirst); i++){
		if (ds_map_find_value(boardMap, arrayfirst[i]) == undefined and arrayfirst[i] != 0) {
			ds_list_add(moveList, arrayfirst[i]);
		}
		
		if (arrayfirst[i] != 0) {
			if((ds_map_find_value(boardMap, arrayfirst[i]) != undefined)){
				if (ds_map_find_value(boardMap, arrayfirst[i]).object_index == obj_player1){
					arraySecond = ds_map_find_value(secondMovement, originalPosition);
					ds_list_add(moveList, arraySecond[i]);
					instance = arraySecond[i];
					destroyInstance = arrayfirst[i];
				}
			}
		}
	}
	return moveList;
}

function numTigerTrapped() {
	numTigersTrapped = 0;
	lst = ds_list_create();
	fMovement = dataScript();
	sMovement = TwoStepdataScript();
	
	show_debug_message(string(ds_list_size(tigersList)) + " Tigers in board");
	for (k = 0; k < ds_list_size(tigersList); k++) {
		//show_debug_message(string(k));
	
		t1 = ds_list_find_value(tigersList, k);
		xVar = t1.x;
		yVar = t1.y;
		num1 = getMapLocation(xVar, yVar);

		af = ds_map_find_value(fMovement, num1);
		for (i = 0; i < array_length_1d(af); i++){
			if (ds_map_find_value(boardMap, af[i]) == undefined and af[i] != 0) {
				ds_list_add(lst, af[i]);
			}
			 else if (ds_map_find_value(boardMap, af[i]) != undefined) {
				if (ds_map_find_value(boardMap, af[i]).object_index == obj_player1) {
					aS = ds_map_find_value(sMovement, num1);
					if (aS[i] != 0){
						if (ds_map_find_value(boardMap, aS[i]) == undefined) {
							ds_list_add(lst, aS[i]);
						}
					}
				}
			}
		}
		
		
		if (ds_list_size(lst) == 0) {
			numTigersTrapped++;
		}
		show_debug_message(string(ds_list_size(lst)) + "size");
		ds_list_clear(lst);
		
	}
	show_debug_message(string(numTigersTrapped) + "Trapped TIGERS");
	
	if (numTigersTrapped == 4){
		// If 4 tigers are trapped then go to room were goat win is created.
		//CopyRight sound:
		//http://www.mountaincharlie1850.org/sounds/goat_bleat_01.wav
		audio_play_sound(goat_sound,1,false);
		room_goto(WinRoom_Goat);
	}
	return numTigersTrapped;
}