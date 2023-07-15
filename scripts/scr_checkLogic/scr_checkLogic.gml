function scr_checkLogic(selectedPiece, pieceLocations, boardTiles, xPos, yPos){
	
	// reset piece and square arrays
	p1_pieces = [];
	p2_pieces = [];
	p1_squares = [];
	p2_squares = [];
	forCheck = true;

	// populate piece arrays with board pieces
	for(var i = 0; i <= global.boardWidth; i+=1){
		for(var j = 0; j <= global.boardHeight; j+=1){
			
			currLoc = pieceLocations[# i, j];
			if (currLoc != noone and currLoc.piecePlayer == "1") {
				array_push(p1_pieces, currLoc);
			} else if (currLoc != noone and currLoc.piecePlayer == "2") {
				array_push(p2_pieces, currLoc);
			}
		}
	}
	
	// populate squares arrays based on valid moves of player 1's pieces
	for (var i = 0; i < array_length(p1_pieces); i+=1) {
		
		var curr = p1_pieces[i]; 
		x1 = curr.xPos;
		y1 = curr.yPos;
		piece = curr.pieceType;
		first = curr.firstMove;
		piecePlayer = curr.piecePlayer;
		moves = curr.validMoves;
		checks = curr.extraCheckMoves; 
		
		if (piece == "P") {
			scr_pawnMoves(x1, y1, moves, first, checks, piecePlayer, forCheck);
		}
		if (piece == "R") {
			scr_rookMoves(x1, y1, moves, checks, piecePlayer, forCheck);
		}
		if (piece == "K") {
			scr_knightMoves(x1, y1, moves, checks, piecePlayer, forCheck);
		}
		if (piece == "B") {
			scr_bishopMoves(x1, y1, moves, checks, piecePlayer, forCheck);
		}
		if (piece == "Q") {
			scr_queenMoves(moves, x1, y1, checks, piecePlayer, forCheck);
		}
		if (piece == "W") {
			scr_kingMoves(x1, y1, moves, first, checks, piecePlayer, forCheck);
		}
	
		for (var j = 0; j < ds_list_size(p1_pieces[i].validMoves); j++) {
			array_push(p1_squares, moves[|j]); 
		}

		for (var k = 0; k < ds_list_size(p1_pieces[i].extraCheckMoves); k++) {
			array_push(p1_squares, checks[|k]);
		}
	}
		
	// populate squares arrays based on valid moves of player 2's pieces
	for (var i = 0; i < array_length(p2_pieces); i+=1) {
		
		var curr = p2_pieces[i]; 
		x1 = curr.xPos;
		y1 = curr.yPos;
		piece = curr.pieceType;
		first = curr.firstMove;
		piecePlayer = curr.piecePlayer;
		moves = curr.validMoves;
		checks = curr.extraCheckMoves; 
		
		
		if (piece == "P") {
			scr_pawnMoves(x1, y1, moves, first, checks, piecePlayer, forCheck);
		}
		if (piece == "R") {
			scr_rookMoves(x1, y1, moves, checks, piecePlayer, forCheck);
		}
		if (piece == "K") {
			scr_knightMoves(x1, y1, moves, checks, piecePlayer, forCheck);
		}
		if (piece == "B") {
			scr_bishopMoves(x1, y1, moves, checks, piecePlayer, forCheck);
		}
		if (piece == "Q") {
			scr_queenMoves(moves, x1, y1, checks, piecePlayer, forCheck);
		}
		if (piece == "W") {
			scr_kingMoves(x1, y1, moves, first, checks, piecePlayer, forCheck);
		}
	
		for (var j = 0; j < ds_list_size(p2_pieces[i].validMoves); j++) {
			array_push(p2_squares, moves[|j]);
		}
		
		for (var k = 0; k < ds_list_size(p2_pieces[i].extraCheckMoves); k++) {
			array_push(p2_squares, checks[|k]);
		}
	}
}