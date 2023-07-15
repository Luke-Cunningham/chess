audio_play_sound(snd_menuSelect, 0, 0);

switch(menuLevel){
	case 0:  // Main menu
		switch(menuPosition){ 
			case 0:  // Single Player selected
				menuLevel = 1; // Go to Color selection
				menuPosition = 0; 
				global.selectedGamemode = 0; 
				break; 
				
			case 1:  // Multiplayer selected
				menuLevel = 99; // Directly to confirmation screen
				menuPosition = 0; 
				global.selectedGamemode = 1;
				break;
				
			case 2:  // Quit Game selected
	 			game_end();	
				break; 
		}
		break; 
	
	case 1:  // Color selection
		switch(menuPosition){ 
	        case 0: 
	        case 1:
	            global.playerSelection[0] = menuOption[menuLevel, menuPosition];
	            menuLevel = 2;  // Go to Difficulty selection
	            menuPosition = 0;
	            break; 
                
	        case 2:  // Back selected
	            global.playerSelection[0] = noone;
	            global.selectedGamemode = noone;
	            menuLevel = 0; // Go back to Main menu
	            menuPosition = 0;
	            break;
	    }
	    break; 
	
	case 2:  // Difficulty selection
		switch(menuPosition){  
			case 0:
			case 1:
				global.AIDIFFICULTY = menuPosition;
				menuLevel = 99; // Move to confirmation screen
				menuPosition = 0;
				break;
				
			case 2:  // Back selected
				global.AIDIFFICULTY = noone;
				global.playerSelection[0] = noone;
				menuLevel = 1; // Move back to color selection
				menuPosition = 0;
				break;
		}
		break; 
			
	case 99:  // Confirmation screen
		switch(menuPosition){
			case 0: // Confirm option
				audio_stop_all();
				room_goto(rm_chessGame); 
				break;
				
			case 1: // Cancel option
				global.AIDIFFICULTY = noone;
				global.playerSelection[0] = noone;
				global.playerSelection[1] = noone;
				if(global.selectedGamemode == 0){
					menuLevel = 1;  // Go back to color selection
				}else{
					menuLevel = 0;  // Go back to main menu
				}
				menuPosition = 0;
				break;
		}
		break;
}
