currentlySelectedPiece = false;

for(var i = 0; i < ds_grid_width(boardTiles); i+=1){
	for(var j = 0; j < ds_grid_height(boardTiles); j+=1){
		currentTile = boardTiles[# i, j];
		currentTile.sprite_index = currentTile.squareSprite;
	}
}

selectedPiece = noone; 