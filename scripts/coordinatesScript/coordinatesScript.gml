// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coordinatesScript() 
{
	xList = [7,124, 250, 375, 490];
	yList = [15, 127, 250, 375, 490];
	
	coordinatesMap = ds_map_create();
	
	for (i = 0; i < 5; i++) {
		for (j = 1; j <=5; j++) {
			ds_map_add(coordinatesMap, i*5+j, [xList[i], yList[j-1]]);
		}
	}
	
	return coordinatesMap;
}

function getMapLocation(pointX, pointY) {
	xList = [7,124, 250, 375, 490];
	yList = [15, 127, 250, 375, 490];
	num = 0;
	
	for (i = 0; i < 5; i ++) {
		if (pointY == yList[i]) {
			num = i*5;	
		}
	}
	
	for (i = 1; i <= 5; i ++) {
		if (pointX == xList[i-1]) {
			num +=i;	
		}
	}
	return num;
}

function getCoordinateX(pointX) {
	xList = [7,124, 250, 375, 490];
	shit = pointX/5;
	shitass = int64(shit) + 1;
	return xList[shitass];
}

function getCoordinateY(pointY) {
	yList = [15, 127, 250, 375, 490];
	shit = pointY%5;
	shitass = int64(shit);
	return yList[shitass];
}

function movableLocations(x,y) 
{
	xList = [7,124,250,375,490]
	yList = [15, 127, 250, 375, 490]
	check1 = 1000
	check2 = 1000
	closestX = 0
	closestY = 0
	X_Y_Array = array_create(4)
	for (i = 0; i< array_length_1d(xList); i++) {
	    if(abs(x-xList[i])<check1) {
	        check1 = abs(x-xList[i])
	        closestX = xList[i]
		}
	}

	for (j = 0; j< array_length_1d(yList); j++) {
	    if(abs(y-yList[j])<check2) {
	        check2 = abs(y-yList[j])
	        closestY = yList[j]
		}
	}
	X_Y_Array[0] = check1
	X_Y_Array[1] = check2
	X_Y_Array[2] = closestX
	X_Y_Array[3] = closestY
	return X_Y_Array
}