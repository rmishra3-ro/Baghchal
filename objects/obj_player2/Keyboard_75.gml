/*

CheatCode: If K is pressed then kill all the goats.

*/

with(obj_player1){
	instance_destroy();
}
if(!instance_exists(obj_player1)) {
	// copyright sound:  http://www.blight.com/~ja-wells/sounds/growl.wav
    audio_play_sound(Sound_tiger_roar, 1, false);
    room_goto(WinRoom_Tiger);
}

