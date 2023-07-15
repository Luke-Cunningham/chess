
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
scr_kingMoves(xPos, yPos, validMoves, firstMove, extraCheckMoves, piecePlayer, forCheck);
scr_showGreenMoves();