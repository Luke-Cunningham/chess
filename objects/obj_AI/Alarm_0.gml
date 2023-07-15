/// @description Movement of pieces after 1 second

var xPos = chosenSquare.xPos;
var yPos = chosenSquare.yPos;

if(obj_chessController.pieceLocations[# xPos, yPos] != noone){ //If the tile has a peice that must be an enemy, as it only selects enemy tiles not friendly

		killedPiece = obj_chessController.pieceLocations[# xPos, yPos];
		killedPiece.isDead = true; //set piece to dead
		//killedPiece.sprite_index = ;//set dead piece sprite to the appropriate sprite 
		
		//check if the killed pieces is 
		if(killedPiece.pieceType == "W"){
			
			global.WinnerPlayer = 2;
			global.Winner = global.aiSelection; //set the team 
			global.gameOver = true;
			audio_play_sound(aiYouLose, 1, 0);
			alarm[1] = 5 * room_speed;

			
		}
		
		
		
		//check which team the piece is on and add it to the appropriate graveyard
		if(killedPiece.piecePlayer == 1){
			type = string(killedPiece.pieceType);
			array_push(obj_chessController.p1_dead, type); //insert to the player 1 graveyard the piece being removed
			
		}else{
			type = string(killedPiece.pieceType);
			array_push(obj_chessController.p2_dead, type); //insert to the player 2 graveyard as the piece is being destroyed/removed
		}
		
		instance_destroy(killedPiece); //destroy the instance
		
		//play the taken sound,can be updated later to a better sound when animations are played, etc. 
		//NOTE: ANIMATION LOGIC GOES HERE TO PLAY AND DELAY MORE GAMEPLAY
		playTakeSound(aiSelectedPiece.pieceType, global.playerSelection[global.currentPlayerTurn - 1]);
}



ds_grid_set(obj_chessController.pieceLocations, xPos, yPos, obj_chessController.pieceLocations[# obj_chessController.selectedPiece.xPos, obj_chessController.selectedPiece.yPos]);
ds_grid_set(obj_chessController.pieceLocations, obj_chessController.selectedPiece.xPos, obj_chessController.selectedPiece.yPos, noone);


obj_chessController.pieceLocations[# xPos, yPos].xPos = xPos;
obj_chessController.pieceLocations[# xPos, yPos].yPos = yPos;

obj_chessController.pieceLocations[# xPos, yPos].x = obj_chessController.boardTiles[# xPos, yPos].x + obj_chessController.boardTiles[# xPos, yPos].sprite_width / 2;
obj_chessController.pieceLocations[# xPos, yPos].y = obj_chessController.boardTiles[# xPos, yPos].y + obj_chessController.boardTiles[# xPos, yPos].sprite_height / 2;


//AI pawn promotion 
if(aiSelectedPiece.pieceType == "P" && aiSelectedPiece.yPos == 7){
	
		var xPixel = obj_chessController.pieceLocations[# xPos, yPos].x;
		var yPixel = obj_chessController.pieceLocations[# xPos, yPos].y;
	
		instance_destroy(aiSelectedPiece); //destroy the instance
		replacePiece = instance_create_layer(xPixel, yPixel, "Instances", obj_queen); //create a queen object
		replacePiece.sprite_index = obj_chessController.p2Sprites[4];
		replacePiece.piecePlayer = 2;
		
		
		replacePiece.image_xscale = obj_chessController.boardTiles[# 0, 0].sprite_width / replacePiece.sprite_width;
        replacePiece.image_yscale = obj_chessController.boardTiles[# 0, 0].sprite_height / replacePiece.sprite_height;
		//set the x and y location of the peice 
		replacePiece.xPos = xPos;
		replacePiece.yPos = yPos;
					
		//destroy the pawn instance
		//instance_destroy(obj_chessController.pieceLocations[# xPos, yPos]); 
		instance_destroy(aiSelectedPiece); 
		ds_grid_set(obj_chessController.pieceLocations, xPos, yPos, noone);
										
		//place our instance into the location in the grid 
		ds_grid_set(obj_chessController.pieceLocations, xPos, yPos, replacePiece);
}


//unselect the first move for the piece that was chosen 
if (obj_chessController.pieceLocations[# xPos, yPos].firstMove) {
	obj_chessController.pieceLocations[# xPos, yPos].firstMove = false;
}

//set the statistics that are used to track info to false 
obj_chessController.selectedPiece = noone; 
obj_chessController.currentlySelectedPiece = false; 


global.currentPlayerTurn = 1; //set turn to player 1, indicating the end of the AI turn	
validPieceSelected = false;
global.aiLocked = false;