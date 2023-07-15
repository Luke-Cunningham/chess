// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function selectRandomPiece(){
	
	
	//choose a piece to load, will choose randomly (currently)
	validPieceSelected = false;

	numberAiPieces = array_length(obj_chessController.p2_pieces); 
	aiSelectedPiece = noone;

	//while the AI hasn't chosen a valid piece, we will loop until it does
	while(!validPieceSelected){
	
		//seed the random number generator 
		randomize();
	
		//generate a number for the piece to capture
		var indexSelected = irandom(numberAiPieces - 1); 

	
		aiSelectedPiece = obj_chessController.p2_pieces[indexSelected]; //capture the piece selected
		var xPos = aiSelectedPiece.xPos;
		var yPos = aiSelectedPiece.yPos;
		obj_chessController.selectedPiece = aiSelectedPiece;
	
		//now generate the moves that the piece can conduct 
		if(aiSelectedPiece.pieceType == "P"){
			scr_pawnMoves(xPos, yPos, aiSelectedPiece.validMoves, aiSelectedPiece.firstMove,  aiSelectedPiece.extraCheckMoves, aiSelectedPiece.piecePlayer, aiSelectedPiece.forCheck);
		}else if(aiSelectedPiece.pieceType == "R"){
					scr_rookMoves(xPos, yPos, aiSelectedPiece.validMoves, aiSelectedPiece.extraCheckMoves, aiSelectedPiece.piecePlayer, aiSelectedPiece.forCheck);
		}else if(aiSelectedPiece.pieceType == "K"){
				scr_knightMoves(xPos, yPos, aiSelectedPiece.validMoves, aiSelectedPiece.extraCheckMoves, aiSelectedPiece.piecePlayer, aiSelectedPiece.forCheck);
		}else if(aiSelectedPiece.pieceType == "B"){
			scr_bishopMoves(xPos, yPos, aiSelectedPiece.validMoves, aiSelectedPiece.extraCheckMoves, aiSelectedPiece.piecePlayer, aiSelectedPiece.forCheck);
		}else if(aiSelectedPiece.pieceType == "Q"){
				scr_queenMoves(aiSelectedPiece.validMoves, xPos, yPos, aiSelectedPiece.extraCheckMoves, aiSelectedPiece.piecePlayer, aiSelectedPiece.forCheck);
		}else if(aiSelectedPiece.pieceType == "W"){
				scr_kingMoves(xPos, yPos, aiSelectedPiece.validMoves, aiSelectedPiece.firstMove, aiSelectedPiece.extraCheckMoves, aiSelectedPiece.piecePlayer, aiSelectedPiece.forCheck);
		}
	
	
		//if the AI chose a piece that has no valid moves 
		if(ds_list_size(aiSelectedPiece.validMoves) == 0){
			continue; //reloop as we want to conduct a new piece selection 
		}else{
			validPieceSelected = true;	
		}
	}
}



function selectRandomSpace(){
	
	numberMovesPossible = ds_list_size(aiSelectedPiece.validMoves); 
	moveIndex = irandom(numberMovesPossible - 1);
	chosenSquare = aiSelectedPiece.validMoves[| moveIndex];


}