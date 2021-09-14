globalvar instance, destroyInstance, goatsKilled;
instance = 0;
destroyInstance = 0;
goatsKilled = 0;
globalvar firstTurn;
firstTurn = true;

globalvar moveList;
moveList = ds_list_create();

globalvar counter;
counter = 0;
globalvar goatTurn;
goatTurn = true;
globalvar tigerTurn;
tigerTurn = false;

globalvar movementMap, boardMap;
movementMap = dataScript();
boardMap = ds_map_create();

ins1 = instance_create_layer(7,15,"Player_Layer", obj_player2);
ds_map_add(boardMap, 1, ins1);
ins2 = instance_create_layer(7,490,"Player_Layer", obj_player2);
ds_map_add(boardMap, 5, ins2);
ins3 = instance_create_layer(490,15,"Player_Layer", obj_player2);
ds_map_add(boardMap, 21, ins3);
ins4 = instance_create_layer(490,490,"Player_Layer", obj_player2);
ds_map_add(boardMap, 25, ins4);

globalvar tigersList;
tigersList = ds_list_create();
ds_list_add(tigersList, ins1, ins2, ins3, ins4);
