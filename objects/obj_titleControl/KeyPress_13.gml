
if(canInteract){ 
	canInteract = false;
	moveToMenu = true; 
	audio_play_sound(snd_select, 1, 0);
	alarm[0] = room_speed * .24;
}
