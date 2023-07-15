
event_inherited();

if(global.selectedGamemode == 0 && global.currentPlayerTurn == 2){
	return;	
}

if(global.currentPlayerTurn != piecePlayer){
	return; 
}

if(obj_chessController.currentlySelectedPiece){
	reClickPiece(obj_chessController.boardTiles, self.id);	
}

obj_chessController.currentlySelectedPiece = true;
scr_bishopMoves(xPos, yPos, validMoves, extraCheckMoves, piecePlayer, forCheck);
scr_showGreenMoves();
