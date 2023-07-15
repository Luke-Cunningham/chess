// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkCheckMate(pieceLocations, boardTiles){
	show_debug_message("in here")
	
	// reset piece and square arrays
	p1_pieces = [];
	p2_pieces = [];
	p1_squares = [];
	p2_squares = [];
	forCheck = true;
	
	//store the kings so we know waht piece to look for
	var p1King = noone;
	var p1KingSquare = noone;
	var p2King = noone;
	var p2KingSquare = noone;

	// populate piece arrays with board pieces
	for(var i = 0; i <= global.boardWidth; i+=1){
		for(var j = 0; j <= global.boardHeight; j+=1){
			
			currLoc = pieceLocations[# i, j];
			if (currLoc != noone and currLoc.piecePlayer == "1") {
				
				//set the king for the player 1
				if(currLoc.pieceType == "W"){
					show_debug_message("WE HAVE KING 1")
					p1King = pieceLocations[# i, j];;
					p1KingSquare = boardTiles[# i, j];
				}
				
				array_push(p1_pieces, currLoc);
			} else if (currLoc != noone and currLoc.piecePlayer == "2") {
				//set the king for the player 2
				if(currLoc.pieceType == "W"){
					show_debug_message("WE HAVE KING 1")
					p2King = pieceLocations[# i, j];;	
					p2KingSquare = boardTiles[# i, j];
				}

				array_push(p2_pieces, currLoc);
			}
		}
	}
	
	//choose which array to conduct piece 
	var pieceArray = noone;
	if(global.currentPlayerTurn == 2){
		pieceArray = p2_pieces;
	}else{
		pieceArray = p1_pieces;
	}
	
	
	//now to fill up the valid moves for the two players
	//how we analyze it will depend on which team it is 
	
	//arrays to be filled based on if a piece can see the king 
	var p2CanSeeKing1 = [];
	var p1CanSeeKing2 = [];

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
		
		//iterate through and see if the valid moves contains moves that the other 
		for(var m = 0; m < ds_list_size(curr.validMoves); m++){
				
			if(curr.validMoves[| m] == p2KingSquare){
				array_push(p1CanSeeKing2, p1_pieces[i]);
			}
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
		
		//iterate through and see if the valid moves contains moves that the other 
		for(var m = 0; m < ds_list_size(curr.validMoves); m++){
				
			if(curr.validMoves[| m] == p1KingSquare){
				array_push(p2CanSeeKing1, p2_pieces[i]);
			}
		}
	
		for (var j = 0; j < ds_list_size(p2_pieces[i].validMoves); j++) {
			array_push(p2_squares, moves[|j]);
		}
		
		for (var k = 0; k < ds_list_size(p2_pieces[i].extraCheckMoves); k++) {
			array_push(p2_squares, checks[|k]);
		}
	}
	
	
	

	//Now we have a list of pieces that can see the other player's king at the current sitation 
	//now we will analyze what situation we are in 
	
	//set the king piece that we will be interested in 
	var curr = noone;
	if(global.currentPlayerTurn == 1){
		curr = p1King;	
	}else{
		curr = p2King;	
	}

	//get values for the values of the king
	x1 = curr.xPos;
	y1 = curr.yPos;
	piece = curr.pieceType;
	first = curr.firstMove;
	piecePlayer = curr.piecePlayer;
	moves = curr.validMoves;
	checks = curr.extraCheckMoves; 

	//generate the moves for the king 
	scr_kingMoves(x1, y1, moves, first, checks, piecePlayer, forCheck);

	//Now to do the check logic itself
	
	//if player 1 turn (since just changed moves)
	if(global.currentPlayerTurn == 1){

		//DOUBLE CHECK LOGIC, KING IS SEEN BY 2 PIECES AND HAS NO MOVES LEFT
		
		//if there are multiple p2 pieces looking at the p1 king, and the p1 king can do nothing
		if(array_length(p2CanSeeKing1) > 1 && ds_list_size(curr.validMoves) == 0){
			global.Winner = global.playerSelection[1];
			global.WinnerPlayer = 2;
			room_goto(rm_victory);
		}
		
	}else{
		
		//DOUBLE CHECK LOGIC, KING IS SEEN BY 2 PIECES AND HAS NO MOVES LEFT
		
		//if there are multiple p2 pieces looking at the p1 king, and the p1 king can do nothing
		if(array_length(p1CanSeeKing2) > 1 && ds_list_size(curr.validMoves) == 0){
			global.Winner = global.playerSelection[0];
			global.WinnerPlayer = 1;
			room_goto(rm_victory);

		}	
	}
	
	//now let's see how many times the king is in the valid moves (multiple times implies multipe moves
	
	
	//iterate through the enemy moves to see hwo many times our king is in check 
	
	
	show_debug_message("out of here")

}