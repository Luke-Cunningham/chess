
function scr_knightMoves(xPos, yPos, validMoves, extraCheckMoves, piecePlayer, forCheck){
	
	ds_list_clear(validMoves);
	ds_list_clear(extraCheckMoves);
		
	for(var i = 0; i <= global.boardWidth; i +=1){
		for(var j = 0; j <= global.boardHeight; j +=1){
			
			xDifference = abs(xPos - i);
			yDifference = abs(yPos - j);
			cSquared = power(xDifference, 2) + power(yDifference, 2);
			currLoc = obj_chessController.pieceLocations[# i, j];
			currTile = obj_chessController.boardTiles[# i, j];
			
			if(cSquared == 5){
				if(xDifference < 1 || yDifference < 1 || xDifference > 2 || yDifference > 2){
					continue; 
				}
				
				if (currLoc == noone) {
					ds_list_add(validMoves, currTile);
				} else { 
					if (currLoc.piecePlayer != piecePlayer) {
						ds_list_add(validMoves, currTile);
						continue;
					} else if (forCheck and currLoc.piecePlayer == piecePlayer) {
						ds_list_add(extraCheckMoves,currTile);
						continue;
					}
				}
			} else { 
				continue;	
			}
		}
	}
}