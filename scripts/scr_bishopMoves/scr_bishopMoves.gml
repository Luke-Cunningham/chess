
function scr_bishopMoves(xPos, yPos, validMoves, extraCheckMoves, piecePlayer, forCheck){
	ds_list_clear(validMoves);
	ds_list_clear(extraCheckMoves);
	
	// check diagonal up and left
	yI = yPos - 1;
	xI = xPos - 1;	
	while(yI >= 0 and xI >=0){
		currTile = obj_chessController.boardTiles[# xI, yI];
		currLoc = obj_chessController.pieceLocations[# xI, yI];
		if(currLoc == noone){	
			ds_list_add(validMoves, currTile);
		}else{ 
			if(currLoc.piecePlayer == piecePlayer){
				if forCheck {
					ds_list_add(extraCheckMoves, currTile);
					
					break;
				} else {
					break;
				}
			}else{ 
				ds_list_add(validMoves, currTile); 
				break; 
			}
		}
		yI -= 1;
		xI -= 1;
	}

	// check diagonal up and right
	yI = yPos - 1;
	xI = xPos + 1;
	while(yI >= 0 and xI <= global.boardWidth){
		currTile = obj_chessController.boardTiles[# xI, yI];
		currLoc = obj_chessController.pieceLocations[# xI, yI];
		if(currLoc == noone){	
			ds_list_add(validMoves, currTile);
		}else{ 
			if(currLoc.piecePlayer == piecePlayer){
				if forCheck {
					ds_list_add(extraCheckMoves, currTile);
					break;
				} else {
					break;
				}
			}else{ 
				ds_list_add(validMoves, currTile); 
				break; 
			}
		}
		yI -= 1;
		xI += 1;
	}

	//Check diagonal down left direction
	yI = yPos + 1;
	xI = xPos - 1;
	while(yI <= global.boardHeight and xI >=0){
		currTile = obj_chessController.boardTiles[# xI, yI];
		currLoc = obj_chessController.pieceLocations[# xI, yI];
		if(currLoc == noone){	
			ds_list_add(validMoves, currTile);
		}else{ 
			if(currLoc.piecePlayer == piecePlayer){
				if forCheck {
					ds_list_add(extraCheckMoves, currTile);
					break;
				} else {
					break;
				}
			}else{ 
				ds_list_add(validMoves, currTile); 
				break; 
			}
		}
		yI += 1;
		xI -= 1;
	}

	//check diagonally down and right
	yI = yPos + 1;
	xI = xPos + 1;
	while(yI <= global.boardHeight and xI <= global.boardWidth){
		currTile = obj_chessController.boardTiles[# xI, yI];
		currLoc = obj_chessController.pieceLocations[# xI, yI];
		if(currLoc == noone){	
			ds_list_add(validMoves, currTile);
		}else{ 
			if(currLoc.piecePlayer == piecePlayer){
				if forCheck {
					ds_list_add(extraCheckMoves, currTile);
					break;
				} else {
					break;
				}
			}else{ 
				ds_list_add(validMoves, currTile); 
				break; 
			}
		}
		yI += 1;
		xI += 1;
	}
}