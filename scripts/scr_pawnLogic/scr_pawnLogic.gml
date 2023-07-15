
function scr_pawnLogic(piecePlayer, selectedPiece, pieceLocations, xPos, yPos){

	if(selectedPiece.pieceType != "P"){
		return;	
	} 
	
	if (piecePlayer == 1) {
		var moveDir = -1; 
	} else {
		var moveDir = 1; 	
	}
	
	currLoc = pieceLocations[# xPos, yPos];

	// check if pawn moved forward 2 for enpassantable
	if(pieceLocations[# xPos, yPos].firstMove){
		if (yPos == 3 or yPos == 4) {
			for (var i = 0; i < instance_number(obj_pawn); ++i;) {
				enemy[i] = instance_find(obj_pawn,i);  
				enemy[i].enPassantable = false;
			}
			currLoc.enPassantable = true;
		}
	}

	// enpassantable kill logic 
	if(currLoc.pieceType == "P"){
		if(currLoc.piecePlayer == "1"){
			var passedDirection = 1;	
		}else{
			var passedDirection = -1;		
		}
		
		passedLoc = pieceLocations[# xPos, yPos + passedDirection];
		// Check if that piece is a pawn 
		if(passedLoc != noone and passedLoc.pieceType == "P" and passedLoc.enPassantable){
			instance_destroy(passedLoc.id)
			ds_grid_set(pieceLocations, selectedPiece.xPos, selectedPiece.yPos + passedDirection, noone);
		}
	}

	// Pawn promotion logic 
	if (currLoc.pieceType == "P" && (global.selectedGamemode != 0 || (global.selectedGamemode == 0 && global.currentPlayerTurn == 1))) {
		if ((yPos == 0  and currLoc.piecePlayer == 1) or (yPos == global.boardHeight and currLoc.piecePlayer == 2)) {
			show_debug_message("PROMOTION")
			promotionPiece = currLoc; 
			instance_create_layer(0, 0, "Instances", obj_pawnSelection);
		}
	}
}