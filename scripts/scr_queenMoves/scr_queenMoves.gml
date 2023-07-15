
function scr_queenMoves(validMoves, xPos, yPos, extraCheckMoves, piecePlayer, forCheck){
	ds_list_clear(validMoves);
	ds_list_clear(extraCheckMoves);
	obj_chessController.currentlySelectedPiece = true;
		
		
	// up direction
	for(var yI = yPos - 1; yI >= 0; yI--){ 
		
		currLoc = obj_chessController.pieceLocations[# xPos, yI];
		currTile =  obj_chessController.boardTiles[# xPos, yI];
		
		if(currLoc == noone){	
			ds_list_add(validMoves,currTile);
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
	}

	// down direction 
	for(var yI = yPos + 1; yI <= global.boardHeight; yI++){ 
		
		currLoc = obj_chessController.pieceLocations[# xPos, yI];
		currTile =  obj_chessController.boardTiles[# xPos, yI];
		
		if(currLoc == noone){	
			ds_list_add(validMoves,currTile);
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
	}

	//Now check the left direction 
	for(var xI = xPos - 1; xI >= 0;  xI--){ 
		
		currLoc = obj_chessController.pieceLocations[# xI, yPos];
		currTile =  obj_chessController.boardTiles[# xI, yPos];
		
		if(currLoc == noone){	
			ds_list_add(validMoves,currTile);
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
	}
	
	//Now check the right direction 
	for(var xI = xPos + 1; xI <= global.boardWidth;  xI++){ 
		
		currLoc = obj_chessController.pieceLocations[# xI, yPos];
		currTile =  obj_chessController.boardTiles[# xI, yPos];
		
		if(currLoc == noone){	
			ds_list_add(validMoves,currTile);
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
	}
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
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
	xI = xPos + 1
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