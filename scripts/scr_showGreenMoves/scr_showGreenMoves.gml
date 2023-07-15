
function scr_showGreenMoves(){
	
	for(var i = 0; i < ds_list_size(validMoves); i++){
		currentTile = validMoves[| i]; 
		currentTile.sprite_index = spr_tileGreen;
	}
	
	if(ds_list_size(validMoves) == 0){
		obj_chessController.currentlySelectedPiece = false; 
		obj_chessController.selectedPiece = noone; 
		return;
	}
}
