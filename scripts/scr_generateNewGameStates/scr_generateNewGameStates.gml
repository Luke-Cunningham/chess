
function generateNewGameStates(p1_pieces, p2_pieces){
	var rootState = ds_grid_create(8, 8);
	ds_grid_copy(rootState, obj_chessController.pieceLocations);
		
	rootArray = ds_grid_create(1, 4);
	ds_grid_add(rootArray, 0, 0, rootState);
	ds_grid_set(rootArray, 0, 1, scoreBoard(rootState));
	ds_grid_set(rootArray, 0, 2, noone);
	ds_grid_set(rootArray, 0, 3, noone);
	
	var numberOfAIMoves = 0;
	for(var i = 0; i < array_length(p2_pieces); i++){
		var currentPiece = p2_pieces[i];
		var xPos = currentPiece.xPos;
		var yPos = currentPiece.yPos;
		if(currentPiece.pieceType == "P"){
				scr_pawnMovesAI(rootState, xPos, yPos, currentPiece.validMoves, currentPiece.firstMove,  currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
		}else if(currentPiece.pieceType == "R"){
				scr_rookMovesAI(rootState, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
		}else if(currentPiece.pieceType == "K"){
				scr_knightMovesAI(rootState, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
		}else if(currentPiece.pieceType == "B"){
			scr_bishopMovesAI( rootState,xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
		}else if(currentPiece.pieceType == "Q"){
				scr_queenMovesAI(rootState, currentPiece.validMoves, xPos, yPos, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
		}else if(currentPiece.pieceType == "W"){
				scr_kingMovesAI(rootState,xPos, yPos, currentPiece.validMoves, currentPiece.firstMove, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
		}
		numberOfAIMoves += ds_list_size(currentPiece.validMoves);
	}
	
	aiTurnArray = ds_grid_create(numberOfAIMoves, 4);
	var moveCounter = 0; 
	var currentPiece = noone;
	currentBoard = ds_grid_create(8, 8);;
	var currentMove = noone;

	for(var v = 0; v < array_length(p2_pieces); v++){
		var p2Pieces = [];
		array_copy(p2Pieces, 0, p2_pieces, 0, array_length(p2_pieces));
		currentPiece = p2Pieces[v];
		var safeX = currentPiece.xPos;
		var safeY = currentPiece.yPos;
		ds_grid_copy(currentBoard, rootState); 

		for(var i = 0; i < ds_list_size(currentPiece.validMoves); i++){
			array_copy(p2Pieces, 0, p2_pieces, 0, array_length(p2_pieces));
			currentPiece = p2Pieces[v];
			currentPiece.xPos = safeX;
			currentPiece.yPos = safeY;

			ds_grid_copy(currentBoard, rootState); 
			currentMove = currentPiece.validMoves[| i]; 
			var moveX = currentMove.xPos;
			var moveY = currentMove.yPos;
			ds_grid_set(currentBoard, moveX, moveY, currentBoard[# currentPiece.xPos, currentPiece.yPos]);
			currentBoard[# moveX, moveY].xPos = moveX;
			currentBoard[# moveX, moveY].yPos = moveY;
			
			ds_grid_set(currentBoard, safeX, safeY, noone);	
			aiTurnArray[# moveCounter, 0] = ds_grid_create(8,8);
			ds_grid_copy(aiTurnArray[# moveCounter, 0], currentBoard);
			ds_grid_set(aiTurnArray, moveCounter, 1, scoreBoard(currentBoard));
			ds_grid_set(aiTurnArray, moveCounter, 2, currentPiece);
			ds_grid_set(aiTurnArray, moveCounter, 3, currentMove);
			moveCounter++; 
		}	
	}
	
	var numberOfPlayerMoves = 0; 
	for(var i = 0; i < numberOfAIMoves; i++){
		var analysisBoard = aiTurnArray[# i, 0];
		var p1AnalysisPieces = [];
		for(var e = 0; e < 8; e++){
			for(var f = 0; f < 8; f++){
				if(analysisBoard[# e, f] == noone){
					continue;
				}
				if(analysisBoard[# e, f].piecePlayer == 1){
					array_push(p1AnalysisPieces, analysisBoard[# e, f]);	
				}		
			}	
		}
		
		for(var e = 0; e < array_length(p1AnalysisPieces); e++){
			
			var currentPiece = p1AnalysisPieces[e];
			var xPos = currentPiece.xPos;
			var yPos = currentPiece.yPos;
			if(currentPiece.pieceType == "P"){
					scr_pawnMovesAI(analysisBoard, xPos, yPos, currentPiece.validMoves, currentPiece.firstMove,  currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "R"){
						scr_rookMovesAI(analysisBoard, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "K"){
					scr_knightMovesAI(analysisBoard, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "B"){
				scr_bishopMovesAI(analysisBoard, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "Q"){
					scr_queenMovesAI(analysisBoard, currentPiece.validMoves, xPos, yPos, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "W"){
					scr_kingMovesAI(analysisBoard, xPos, yPos, currentPiece.validMoves, currentPiece.firstMove, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}
			numberOfPlayerMoves += ds_list_size(currentPiece.validMoves);
		}			
	}
	
	for(var i = 0; i < 8; i++){
		for(var j = 0; j < 8; j++){
			if(ds_grid_width(aiTurnArray) < 30){
				continue;
			}
		}	
	}

	humanTurnArray = ds_grid_create(numberOfPlayerMoves, 5);
	var moveCounter = 0; 
	var currentPiece = noone;
	currentBoard = ds_grid_create(8, 8);;
	var currentMove = noone;
	for(var aiBoard = 0; aiBoard < numberOfAIMoves; aiBoard++){
		ds_grid_copy(currentBoard, aiTurnArray[# aiBoard, 0]);	
		var p1AnalysisPieces = [];
		for(var e = 0; e < 8; e++){
			for(var f = 0; f < 8; f++){
				if(currentBoard[# e, f].piecePlayer == 1){
					array_push(p1AnalysisPieces, currentBoard[# e, f]);	
				}		
			}	
		}
		
		for(var e = 0; e < array_length(p1AnalysisPieces); e++){
			var iteratePiece = p1AnalysisPieces[e];
			var xPos = iteratePiece.xPos;
			var yPos = iteratePiece.yPos;
			
			if(iteratePiece.pieceType == "P"){
					scr_pawnMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.firstMove,  iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "R"){
						scr_rookMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "K"){
					scr_knightMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "B"){
				scr_bishopMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "Q"){
					scr_queenMovesAI(analysisBoard, iteratePiece.validMoves, xPos, yPos, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "W"){
					scr_kingMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.firstMove, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}
		}					
		
		for(var v = 0; v < array_length(p1AnalysisPieces); v++){
			
			var p1Pieces = [];
			array_copy(p1Pieces, 0, p1AnalysisPieces, 0, array_length(p1AnalysisPieces));
			currentPiece = p1Pieces[v];
			var safeHoldCurrentPiece = p1Pieces[v];
			
			var safeX = currentPiece.xPos;
			var safeY = currentPiece.yPos;
			ds_grid_copy(currentBoard, aiTurnArray[# aiBoard,0]);
			
			var xPos = iteratePiece.xPos;
			var yPos = iteratePiece.yPos;
			
			if(iteratePiece.pieceType == "P"){
					scr_pawnMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.firstMove,  iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "R"){
						scr_rookMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "K"){
					scr_knightMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "B"){
				scr_bishopMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "Q"){
					scr_queenMovesAI(analysisBoard, iteratePiece.validMoves, xPos, yPos, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}else if(iteratePiece.pieceType == "W"){
					scr_kingMovesAI(analysisBoard, xPos, yPos, iteratePiece.validMoves, iteratePiece.firstMove, iteratePiece.extraCheckMoves, iteratePiece.piecePlayer, iteratePiece.forCheck);
			}

			for(var i = 0; i < ds_list_size(currentPiece.validMoves); i++){
				ds_grid_copy(currentBoard, aiTurnArray[# aiBoard, 0]); 
				currentPiece = safeHoldCurrentPiece;
			
					for(var z = 0; z < 8; z++){
						for(var xz = 0; xz < 8; xz++){
							if(aiTurnArray[# aiBoard, 0][# z, xz] != noone){
								aiTurnArray[# aiBoard, 0][# z, xz].xPos = z;
								aiTurnArray[# aiBoard, 0][# z, xz].yPos = xz;
							}
						}
					}
					
			var xPos = currentPiece.xPos;
			var yPos = currentPiece.yPos;
			
			if(currentPiece.pieceType == "P"){
					scr_pawnMovesAI(currentBoard, xPos, yPos, currentPiece.validMoves, currentPiece.firstMove,  currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "R"){
						scr_rookMovesAI(currentBoard, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "K"){
					scr_knightMovesAI(currentBoard, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "B"){
				scr_bishopMovesAI(currentBoard, xPos, yPos, currentPiece.validMoves, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "Q"){
					scr_queenMovesAI(currentBoard, currentPiece.validMoves, xPos, yPos, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}else if(currentPiece.pieceType == "W"){
					scr_kingMovesAI(currentBoard, xPos, yPos, currentPiece.validMoves, currentPiece.firstMove, currentPiece.extraCheckMoves, currentPiece.piecePlayer, currentPiece.forCheck);
			}

				currentMove = currentPiece.validMoves[| i]; 
				var moveY = currentMove.yPos;

				ds_grid_set(currentBoard, moveX, moveY, currentBoard[# currentPiece.xPos, currentPiece.yPos]);
				currentBoard[# moveX, moveY].xPos = moveX;
				currentBoard[# moveX, moveY].yPos = moveY;
				ds_grid_set(currentBoard, safeX, safeY, noone);	
				humanTurnArray[# moveCounter, 0] = ds_grid_create(8,8);

				ds_grid_copy(humanTurnArray[# moveCounter, 0], currentBoard);
				var scoreValue = scoreBoard(currentBoard);
				ds_grid_set(humanTurnArray, moveCounter, 1, scoreValue);
				ds_grid_set(humanTurnArray, moveCounter, 2, currentPiece);
				ds_grid_set(humanTurnArray, moveCounter, 3, currentMove);
				ds_grid_set(humanTurnArray, moveCounter, 4, aiBoard); 
			
				moveCounter++; 
		}
	}

	var lowestScorePlayer = [numberOfAIMoves];  
	for(var i = 0; i < numberOfAIMoves; i++){
		var minValue = 20000; 
		for(var j = 0; j < numberOfPlayerMoves; j++){
			if(humanTurnArray[# j, 1] < minValue && humanTurnArray[# j, 4] == i){
				minValue = 	humanTurnArray[# j, 1];
			}	
		}
		lowestScorePlayer[i] = minValue;
	}

	var maxValue = -90000;
	var bestMoves = []; 
	for(var i = 0; i < array_length(lowestScorePlayer); i++){
		if(lowestScorePlayer[i] > maxValue){
			maxValue = 	lowestScorePlayer[i];
		}
	}
	
	for(var i = 0; i < array_length(lowestScorePlayer); i++){
		if(lowestScorePlayer[i] == maxValue){
			array_push(bestMoves, i)
		}
	}
	
	randomize();
	chooseMove = irandom(array_length(bestMoves) - 1);
	chosenIndex = bestMoves[chooseMove];
	aiSelectedPiece = aiTurnArray[# chosenIndex, 2];
	obj_chessController.selectedPiece = aiSelectedPiece;
	chosenSquare = aiTurnArray[# chosenIndex, 3];
	}
}