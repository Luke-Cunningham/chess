
event_inherited();

//if it is single player, don't let the player click at any point no matter who's turn 
if(global.selectedGamemode == 0 && global.currentPlayerTurn == 2){
	show_debug_message("in here 1")
	return;	
}



//Don't be able to select other peices
if(global.currentPlayerTurn != piecePlayer){
	return; 
}

//if they choose another one of their peices
if(obj_chessController.currentlySelectedPiece){
	
	reClickPiece(obj_chessController.boardTiles, self.id);	
}


obj_chessController.currentlySelectedPiece = true;
scr_queenMoves(validMoves, xPos, yPos, extraCheckMoves, piecePlayer, forCheck);
scr_showGreenMoves();
