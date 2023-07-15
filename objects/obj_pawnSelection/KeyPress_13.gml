audio_play_sound(snd_menuSelect, 0, 0);

switch(menuLevel){ 

	case 0:
		switch(menuPosition){
			case 0: 
				menuLevel = 1;
				menuPosition = 0;
				selectedPiece = "Q";
				break;
				
			case 1: 
				menuLevel = 1;
				menuPosition = 0;
				selectedPiece = "R";
				break;
				
			case 2: 
				menuLevel = 1;
				menuPosition = 0;
				selectedPiece = "B";
				break;
					
			case 3: 
				menuLevel = 1;
				menuPosition = 0;
				selectedPiece = "K";
				break; 
		}
		break;
	
	case 1:
		switch(menuPosition){ 
			case 0:
				xPos = obj_chessController.promotionPiece.xPos; 
				yPos = obj_chessController.promotionPiece.yPos;
				xPixel = obj_chessController.promotionPiece.x;
				yPixel = obj_chessController.promotionPiece.y;

				switch(selectedPiece){
					case "Q":
						replacePiece = instance_create_layer(xPixel, yPixel, "Instances", obj_queen); 
						
						if(obj_chessController.promotionPiece.piecePlayer == 1){
							replacePiece.sprite_index = obj_chessController.p1Sprites[4];
							replacePiece.piecePlayer = 1;
								
						}else{
							replacePiece.sprite_index = obj_chessController.p2Sprites[4];
							replacePiece.piecePlayer = 2;
						}
						
						break;
					
					case "R":
						replacePiece = instance_create_layer(xPixel, yPixel, "Instances", obj_rook); 
						
						if(obj_chessController.promotionPiece.piecePlayer == 1){
							replacePiece.sprite_index = obj_chessController.p1Sprites[1];
							replacePiece.piecePlayer = 1;
							
								
						}else{
							replacePiece.sprite_index = obj_chessController.p2Sprites[1];
							replacePiece.piecePlayer = 2;
						}
						
						break;
					
					case "B":
						replacePiece = instance_create_layer(xPixel, yPixel, "Instances", obj_bishop);
						
						if(obj_chessController.promotionPiece.piecePlayer == 1){
							replacePiece.sprite_index = obj_chessController.p1Sprites[3];
							replacePiece.piecePlayer = 1;	
						}else{
							replacePiece.sprite_index = obj_chessController.p2Sprites[3];
							replacePiece.piecePlayer = 2;
						}
						
						break;

					
					case "K":
						replacePiece = instance_create_layer(xPixel, yPixel, "Instances", obj_knight);
						
						if(obj_chessController.promotionPiece.piecePlayer == 1){
							replacePiece.sprite_index = obj_chessController.p1Sprites[2];
							replacePiece.piecePlayer = 1;
						}else{
							replacePiece.sprite_index = obj_chessController.p2Sprites[2];
							replacePiece.piecePlayer = 2;
						}					
						break;
				}
				
				replacePiece.image_xscale = obj_chessController.boardTiles[# 0, 0].sprite_width / replacePiece.sprite_width;
                replacePiece.image_yscale = obj_chessController.boardTiles[# 0, 0].sprite_height / replacePiece.sprite_height;
				replacePiece.xPos = xPos;
				replacePiece.yPos = yPos;
				
				instance_destroy(obj_chessController.promotionPiece); 
				ds_grid_set(obj_chessController.pieceLocations, xPos, yPos, noone);					
				ds_grid_set(obj_chessController.pieceLocations, xPos, yPos, replacePiece);
					
				instance_destroy(id);
				obj_chessController.promotionPiece = noone;
				global.aiLocked = false;
				break;

			case 1:
				menuLevel = 0;
				menuPosition = 0;
				selectedPiece = noone;
				break;
		}
}
