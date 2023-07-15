if(x < global.yOffset){
	var wideScreen = true; 
}else{
	var wideScreen = false; 
}

if(wideScreen){
	p2StartX = 0;
	p2StartY = 0;
	p1StartX = 0;
	p1StartY = global.yOffset + boardTiles[# 0, 0].sprite_height * ds_grid_height(boardLayout); 
}else{
	p1StartX = 0;
	p1StartY = 0;
	p2StartX = global.xOffset + boardTiles[# 0, 0].sprite_width * ds_grid_width(boardLayout);
	p2StartY = 0;	
}

var drawX = p1StartX;
var drawY = p1StartY;

for(var i = 0; i < array_length(p1_dead); i++){ 
	if(p1_dead[i] == "P"){
		currentSprite = p1Sprites[0];
	}else if(p1_dead[i] == "R"){
		currentSprite = p1Sprites[1];
	}else if(p1_dead[i] == "K"){
		currentSprite = p1Sprites[2];
	}else if(p1_dead[i] == "B"){
		currentSprite = p1Sprites[3];
	}else if(p1_dead[i] == "Q"){
		currentSprite = p1Sprites[4];
	}else if(p1_dead[i] == "W"){
		currentSprite = p1Sprites[5];
	}

	draw_sprite_ext(currentSprite, 0, drawX + scaledWidth / 2, drawY + scaledHeight / 2, xScaleFactor /2, yScaleFactor /2, 0, c_white, 1);

	if(drawX + 1.5 * scaledWidth < (wideScreen ? global.xOffset : room_width)){
		drawX += scaledWidth;
	}else{
		drawX = p1StartX;
		drawY += scaledHeight;
	}
}

drawX = p2StartX;
drawY = p2StartY;

for(var i = 0; i < array_length(p2_dead); i++){
	if(p2_dead[i] == "P"){
		currentSprite = p2Sprites[0];
	}else if(p2_dead[i] == "R"){
		currentSprite = p2Sprites[1];
	}else if(p2_dead[i] == "K"){
		currentSprite = p2Sprites[2];
	}else if(p2_dead[i] == "B"){
		currentSprite = p2Sprites[3];
	}else if(p2_dead[i] == "Q"){
		currentSprite = p2Sprites[4];
	}else if(p2_dead[i] == "W"){
		currentSprite = p2Sprites[5];
	}

	draw_sprite_ext(currentSprite, 0, drawX + scaledWidth / 2, drawY + scaledHeight / 2, xScaleFactor /2, yScaleFactor /2, 0, c_white, 1);

	if(drawX + 1.5 * scaledWidth < (wideScreen ? global.xOffset : room_width)){
		drawX += scaledWidth;
	}else{
		drawX = p2StartX;
		drawY += scaledHeight;
	}
}
