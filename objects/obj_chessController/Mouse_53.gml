
if(!currentlySelectedPiece){
	return; 
}


if(!didClickBoard(boardTiles, mouse_x, mouse_y)){ 
	return;
}

var xPos = (mouse_x - global.xOffset) div boardTiles[# 0, 0].sprite_width;
var yPos = (mouse_y - global.yOffset) div boardTiles[# 0, 0].sprite_height;
var clickedTile = boardTiles[# xPos, yPos]; 

if(clickedTile.squareSprite == clickedTile.sprite_index){
	return; 
}

if(global.gameOver == true){
	return;	
}


if(pieceLocations[# xPos, yPos] != noone){ 
	killedPiece = pieceLocations[# xPos, yPos];
	killedPiece.isDead = true; 
		
	if(killedPiece.pieceType == "W"){
		global.WinnerPlayer = global.currentPlayerTurn;
		global.Winner = global.playerSelection[global.currentPlayerTurn - 1];
		room_goto(rm_victory)
	}
		
	if(killedPiece.piecePlayer == 1){
		type = string(killedPiece.pieceType);
		array_push(p1_dead, type); 
	}else{
		type = string(killedPiece.pieceType);
		array_push(p2_dead, type); 
	}
	instance_destroy(killedPiece); 
	audio_play_sound(snd_capture, 1, 1);
}

ds_grid_set(pieceLocations, xPos, yPos, pieceLocations[# selectedPiece.xPos, selectedPiece.yPos]);
ds_grid_set(pieceLocations, selectedPiece.xPos, selectedPiece.yPos, noone);
pieceLocations[# xPos, yPos].xPos = xPos;
pieceLocations[# xPos, yPos].yPos = yPos;
pieceLocations[# xPos, yPos].x = boardTiles[# xPos, yPos].x + boardTiles[# xPos, yPos].sprite_width / 2;
pieceLocations[# xPos, yPos].y = boardTiles[# xPos, yPos].y + boardTiles[# xPos, yPos].sprite_height / 2;

// Heart of game logic
scr_pawnLogic(piecePlayer, selectedPiece, pieceLocations, xPos, yPos);
scr_castleLogic(selectedPiece, pieceLocations, boardTiles, xPos, yPos);
scr_checkLogic(selectedPiece, pieceLocations, boardTiles, xPos, yPos);

for (var i = 0; i < ds_grid_width(boardTiles); i+=1 ){
	for(var j = 0; j < ds_grid_height(boardTiles); j+=1) {
		currentTile = boardTiles[# i, j];
		currentTile.sprite_index = currentTile.squareSprite;
	}
}

if (pieceLocations[# xPos, yPos].firstMove) {
	pieceLocations[# xPos, yPos].firstMove = false;
}

selectedPiece = noone; 
currentlySelectedPiece = false; 

if (global.currentPlayerTurn == 1) {
	global.currentPlayerTurn = 2;	
} else {
	global.currentPlayerTurn = 1;	
}

obj_chessController.currentlySelectedPiece = false;
