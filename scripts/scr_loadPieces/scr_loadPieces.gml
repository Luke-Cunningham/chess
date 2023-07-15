function loadPieces(csvInfo, squareLocations, player1Sprites, player2Sprites, gameState) {
    for (var xPos = 0; xPos < ds_grid_width(csvInfo); xPos++) {
        for (var yPos = 0; yPos < ds_grid_height(csvInfo); yPos++) {
            if (csvInfo[# xPos, yPos] == "") {
                continue;
            }

            var pieceType = string_copy(csvInfo[# xPos, yPos], 1, 1);
            var piecePlayer = real(string_copy(csvInfo[# xPos, yPos], 2, 2));

            var xScaleFactor = squareLocations[# 0, 0].sprite_width / sprite_get_width(player1Sprites[0]);
            var yScaleFactor = squareLocations[# 0, 0].sprite_height / sprite_get_width(player1Sprites[0]);
			show_debug_message("xScaleFactor: " + string(xScaleFactor));
			show_debug_message("yScaleFactor: " + string(yScaleFactor));

            var xPlacement = squareLocations[# xPos, yPos].x + squareLocations[# xPos, yPos].sprite_width / 2;
            var yPlacement = squareLocations[# xPos, yPos].y + squareLocations[# xPos, yPos].sprite_height / 2;

            var currentPiece;
            switch(pieceType) {
                case "P": 
                    currentPiece = instance_create_layer(xPlacement, yPlacement, "Instances", obj_pawn);
                    currentPiece.sprite_index = piecePlayer == 1 ? player1Sprites[0] : player2Sprites[0];
                    break; 
                case "R": 
                    currentPiece = instance_create_layer(xPlacement, yPlacement, "Instances", obj_rook);
                    currentPiece.sprite_index = piecePlayer == 1 ? player1Sprites[1] : player2Sprites[1];
                    break;
                case "K": 
                    currentPiece = instance_create_layer(xPlacement, yPlacement, "Instances", obj_knight);
                    currentPiece.sprite_index = piecePlayer == 1 ? player1Sprites[2] : player2Sprites[2];
                    break;
                case "B": 
                    currentPiece = instance_create_layer(xPlacement, yPlacement, "Instances", obj_bishop);
                    currentPiece.sprite_index = piecePlayer == 1 ? player1Sprites[3] : player2Sprites[3];
                    break;
                case "Q":
                    currentPiece = instance_create_layer(xPlacement, yPlacement, "Instances", obj_queen);
                    currentPiece.sprite_index = piecePlayer == 1 ? player1Sprites[4] : player2Sprites[4];
                    break;
                case "W": 
                    currentPiece = instance_create_layer(xPlacement, yPlacement, "Instances", obj_king);
                    currentPiece.sprite_index = piecePlayer == 1 ? player1Sprites[5] : player2Sprites[5];
                    break;	
            }

            currentPiece.image_xscale = xScaleFactor;
            currentPiece.image_yscale = yScaleFactor;
            currentPiece.depth = 0; 
            currentPiece.pieceType = pieceType;
            currentPiece.piecePlayer = piecePlayer;
            currentPiece.xPos = xPos;
            currentPiece.yPos = yPos;
            ds_grid_add(gameState, xPos, yPos, currentPiece);

            if (piecePlayer == 1) {
                array_push(obj_chessController.p1_pieces, currentPiece);
            } else {
                array_push(obj_chessController.p2_pieces, currentPiece);
            }
        } 
    }
}
