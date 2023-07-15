
function scr_castleLogic(selectedPiece, pieceLocations, boardTiles, xPos, yPos){
	if (selectedPiece.pieceType == "W") {
		if (selectedPiece.firstMove) {
			x1 = xPos;
			y1 = yPos;
			
			// Positions where king would end up after castling
			rightCastleLocation = global.boardWidth - 1;
			leftCastleLocation = 2;
			
			// Positions rooks would end up after castling
			rookRightCastle = pieceLocations[# x1 + 1, y1];
			rookLeftCastle = pieceLocations[# x1 - 1, y1];
			
			// Set tiles for rooks after castling
			rookRightSet = boardTiles[# x1 - 1, y1];
			rookLeftSet = boardTiles[# x1 + 1, y1]; 
			
			if (selectedPiece.xPos == rightCastleLocation) { 
				
				// Set rook positioning after castle
				ds_grid_set(pieceLocations, x1 - 1, y1, rookRightCastle);
				rookRightCastle.x = rookRightSet.x + rookRightSet.sprite_width/2;
				rookRightCastle.y = rookRightSet.y + rookRightSet.sprite_height/2;
				rookRightCastle.xPos = x1 - 1;
				rookRightCastle.yPos = y1;	
				
				// Remove old spot of rook
				ds_grid_set(pieceLocations, x1 + 1, y1, noone);
			} 
			
			if (selectedPiece.xPos == leftCastleLocation) {
				
				// Set rook positioning after castle
				ds_grid_set(pieceLocations, x1 + 1, y1, pieceLocations[# xPos - 2, yPos]);
				rookLeftCastle.x = rookLeftSet.x +rookLeftSet.sprite_width/2;
				rookLeftCastle.y = rookLeftSet.y + rookLeftSet.sprite_height/2;
				rookLeftCastle.xPos = x1 + 1;
				rookLeftCastle.yPos = y1;
				
				// Remove old spot of rook 
				ds_grid_set(pieceLocations, x1 - 2, y1, noone);
			}
		}
	}
}