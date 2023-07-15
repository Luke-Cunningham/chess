
if(global.selectedGamemode == 0 and global.playerSelection[0] != noone){
	global.playerSelection[1] = noone;
	singlePlayerSelectionDone = true; 
}

if(global.playerSelection[1] != noone and global.selectedGamemode > 0){
		multiplayerSelectionDone = true; 
}
