
function scr_kingMoves(xPos, yPos, validMoves, firstMove, extraCheckMoves, piecePlayer, forCheck){
	
	ds_list_clear(validMoves);
    ds_list_clear(extraCheckMoves);
	
	// king movement
	for (var i = -1; i < 2;  i++) { 
		for (var j = -1; j < 2; j++) {
			
			var x1= xPos + i;
			var y1 = yPos + j;
			currTile = obj_chessController.boardTiles[# x1, y1];
			currLoc = obj_chessController.pieceLocations[# x1, y1];
			
			if (x1 >= 0 and x1 <= global.boardWidth and y1 >= 0 and y1 <= global.boardHeight) {
				if (currLoc == noone) {
					ds_list_add(validMoves, currTile);
				} else if (currLoc.piecePlayer != piecePlayer) {
					ds_list_add(validMoves, currTile); 
				} else { 
					if (forCheck and currLoc.pieceType != "W") {
						ds_list_add(extraCheckMoves, currTile);
					}
				}
			}
		}
	}

	// remove squares that are under attack
	if (global.currentPlayerTurn == 1) {
		for (var k = 0; k < array_length(obj_chessController.p2_squares); k++){
			var index = ds_list_find_index(validMoves, obj_chessController.p2_squares[k]);
			ds_list_delete(validMoves, index);
		} 
	} else {
		for (var k = 0; k < array_length(obj_chessController.p1_squares); k++){
			var index = ds_list_find_index(validMoves, obj_chessController.p1_squares[k]);
			ds_list_delete(validMoves, index);
		}  
	}
	
				
	// 0 1 2 3 4 5 6 7     : xPos
	// R       K     R     : starting
	//     K R             : left castle
	leftCastleable = true;
	leftRookPos = obj_chessController.pieceLocations[# 0, yPos];
	kingPosAfterLeftCastle = obj_chessController.boardTiles[# xPos - 2, yPos];
	
	if firstMove {
		for (var i = 1; i < 4; i++) {
			
			var x1 = xPos - i;
			currTile = obj_chessController.boardTiles[# x1 + 1, yPos]
			
			// break if piece between them
			if (obj_chessController.pieceLocations[# x1, yPos] != noone) {  
				leftCastleable = false;
				break;
			}

			// break if check in between
			if (global.currentPlayerTurn == 1) {
				if (array_get_index(obj_chessController.p2_squares, currTile) != -1) {
					leftCastleable = false;
					break;
				}
			} else {
				if (array_get_index(obj_chessController.p1_squares, currTile) != -1) {
					leftCastleable = false;
					break;
				}
			}
		}
		
		// if piece here hasn't moved, must be castle eligible rook on left
		if (leftRookPos != noone) { 
			if leftRookPos.firstMove { 
				if leftCastleable {
					ds_list_add(validMoves, kingPosAfterLeftCastle);
				}
			}
		}
	}

	// 0 1 2 3 4 5 6 7     : xPos
	// R       K     R     : starting
	//           R K       : right castle
	rightCastleable = true;
	rightRookPos = obj_chessController.pieceLocations[# global.boardWidth, yPos];
	kingPosAfterRightCastle = obj_chessController.boardTiles[# xPos + 2, yPos];
	
	if firstMove {
		for (var i = 1; i < 4; i++) {  
			
			var x1 = xPos + i;
			currTile = obj_chessController.boardTiles[# x1 - 1, yPos];
			
			// break if piece between them (2 spaces between so stop for loop after 2 iterations)
			if (obj_chessController.pieceLocations[# x1, yPos] != noone and (i < 3)) {  
				rightCastleable = false;
				break;
			} 			
			
			// break if in check or check between
			if (global.currentPlayerTurn == 1) {
				if (array_get_index(obj_chessController.p2_squares, currTile) != -1) {
					rightCastleable = false;
					break;
				}
				
			} else {
				if (array_get_index(obj_chessController.p1_squares, currTile) != -1) {
					rightCastleable = false;
					break;
				}
			}
		}
		
		// if piece here hasn't moved, must be castle eligible rook on right
		if (rightRookPos != noone) { 
			if rightRookPos.firstMove {  
				if rightCastleable {
					ds_list_add(validMoves, kingPosAfterRightCastle);
				}
			}
		}
	}	
}
	
	
	
	
function array_get_index(array, objectToFind){
	
	var foundIndex = -1;
	
	for(var i = 0; i < array_length(array); i++){
		
		if(array[i] == objectToFind){
			
			foundIndex = i;
		}
		
	}
	
	return foundIndex;
	
}