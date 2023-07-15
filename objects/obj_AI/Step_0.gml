/// @description AI Move control 

//if it is not a single player game, don't do anything, ever
if(!canAiPlay){
	return;	
}

//if the player turn isn't player 2, we don't want the AI to do anything 
if(global.currentPlayerTurn != 2 || global.aiLocked){
	return;	
}

global.aiLocked = true;

//now to do the logic of the AI 


//choose a piece to load, will choose randomly (currently)
validPieceSelected = false;

numberAiPieces = array_length(obj_chessController.p2_pieces); 
aiSelectedPiece = noone;
chosenSquare = noone;

if(global.AIDIFFICULTY == 0){
	show_debug_message("RANDOM")
	selectRandomPiece();
	selectRandomSpace();
	
}else if(global.AIDIFFICULTY == 1){
	show_debug_message("SMARTER AI")
	miniMax(obj_chessController.p2_pieces);
}

//get the se


//at this point the AI has a piece that is valid to move, so now it must actually choose a space to move 
//selectRandomSpace();


//RESET THE BOARD CONDITIONS CAUSE SOMETHING FUCKED 
for(var i = 0; i < 8; i++){
	
	for(var j = 0; j < 8; j++){
		
		if(obj_chessController.pieceLocations[# i, j] == noone){
			continue;	
		}
		
	
		obj_chessController.pieceLocations[# i, j].xPos = i;
		obj_chessController.pieceLocations[# i, j].yPos = j;
	}
	
}


//Move the actual piece after a slight delay
alarm[0] = 1 * room_speed;


