
function scr_rookMoves(xPos, yPos, validMoves, extraCheckMoves, piecePlayer, forCheck){
	ds_list_clear(validMoves);
	ds_list_clear(extraCheckMoves)
	
	
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
}