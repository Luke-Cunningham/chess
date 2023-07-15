


if(obj_chessController.selectedPiece == noone and global.currentPlayerTurn == piecePlayer){ 
	obj_chessController.selectedPiece = self.id; 
}else{ 
	return;	

}

ds_list_clear(validMoves); 
