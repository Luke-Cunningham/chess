
function scr_pawnMoves(xPos, yPos, validMoves, firstMove, extraCheckMoves, piecePlayer, forCheck){
	ds_list_clear(validMoves);
	ds_list_clear(extraCheckMoves);
	
	if (piecePlayer == 1) {
		var moveDir = -1; 
	} else {
		var moveDir = 1; 	
	}

	// double and single forward moves
	if (!forCheck) {
		nextLoc = obj_chessController.pieceLocations[# xPos, yPos + moveDir];
		nextTile = obj_chessController.boardTiles[# xPos, yPos + moveDir];
		doubleMoveLoc = obj_chessController.pieceLocations[# xPos, yPos + 2 * moveDir];
		doubleMoveTile = obj_chessController.boardTiles[# xPos, yPos + 2 * moveDir];
		
		if(nextLoc == noone){ 
			ds_list_add(validMoves, nextTile); 
			if(firstMove and doubleMoveLoc == noone){ 
				ds_list_add(validMoves, doubleMoveTile); 
			}
		}
	}
	
	leftX = xPos - 1;
	rightX = xPos + 1;
	checkY = yPos + moveDir;
	
	leftLoc = obj_chessController.pieceLocations[# leftX, yPos];
	leftDiagLoc = obj_chessController.pieceLocations[# leftX, checkY];
	leftDiagTile = obj_chessController.boardTiles[# leftX, checkY];
	rightLoc = obj_chessController.pieceLocations[# rightX, yPos];
	rightDiagLoc = obj_chessController.pieceLocations[# rightX, checkY];
	rightDiagTile = obj_chessController.boardTiles[# rightX, checkY];
	
	// en passant
	if (!forCheck) {
		if (leftX >= 0 and leftLoc != noone and leftLoc.pieceType == "P") {
			if (leftLoc.enPassantable) {
				ds_list_add(validMoves, leftDiagTile);
			}
		}
		
	
		if (rightX <= global.boardWidth and rightLoc != noone and rightLoc.pieceType == "P") {
			if (rightLoc.enPassantable) {
				ds_list_add(validMoves, rightDiagTile);
			}
		}
	}
		
	// left diagonal capturing and check logic
	if (leftX >= 0 and checkY >= 0 and checkY <= global.boardHeight) {
		if (leftDiagLoc != noone and leftDiagLoc.piecePlayer != piecePlayer) {
			ds_list_add(validMoves, leftDiagTile); 
		} else {
			if forCheck {
				ds_list_add(extraCheckMoves, leftDiagTile);
			}
		}
	}
	
	// right diagonal capturing and check logic
	if (rightX <= global.boardWidth and checkY >= 0 and checkY <= global.boardHeight) {
		if (rightDiagLoc != noone and rightDiagLoc.piecePlayer != piecePlayer){
			ds_list_add(validMoves, rightDiagTile); 
		} else {
			if (forCheck) {
				ds_list_add(extraCheckMoves, rightDiagTile);
			}
		}
	}
}