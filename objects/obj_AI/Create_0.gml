/// @description Initialize AI variables 

canAiPlay = false; //initialize to false at start

//first set if the AI gets to play via a single player game
if(global.selectedGamemode == 0){
	canAiPlay = true; //allow the AI to play against the player 
}

global.aiLocked = false;

