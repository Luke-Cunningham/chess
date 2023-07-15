
if(canInteract){ 
	canInteract = false;
	exitGame = true; 
	audio_play_sound(snd_back, 1, 0);
	alarm[0] = room_speed * 1.2;
}