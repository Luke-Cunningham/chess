function draw_board() {
    var spriteWhite = asset_get_index("spr_tileLight");
    var spriteBlack = asset_get_index("spr_tileDark");

    var roomMinDim = min(room_width, room_height);
    var tileSize = roomMinDim / 8;

    var boardWidth = tileSize * 8;
    var boardHeight = tileSize * 8;

    var xOffset = (room_width - boardWidth) / 2;
    var yOffset = (room_height - boardHeight) / 2;

    for (var xPos = 0; xPos < 8; xPos++) {
        for (var yPos = 0; yPos < 8; yPos++) {
            var currentDrawX = xOffset + xPos * tileSize;
            var currentDrawY = yOffset + yPos * tileSize;
            var currentTile = instance_create_layer(currentDrawX, currentDrawY, "Instances", obj_boardSquare);

            currentTile.image_xscale = tileSize / sprite_get_width(spriteWhite);
            currentTile.image_yscale = tileSize / sprite_get_height(spriteWhite);

            if ((xPos + yPos) % 2 == 0) {
                currentTile.sprite_index = spriteWhite;
                currentTile.squareSprite = spriteWhite;
            } else {
                currentTile.sprite_index = spriteBlack;
                currentTile.squareSprite = spriteBlack;
            }

            currentTile.depth = 4;
            currentTile.xPos = xPos;
            currentTile.yPos = yPos;
            ds_grid_add(boardTiles, xPos, yPos, currentTile);
        }
    }

    global.boardWidth = boardWidth;
    global.boardHeight = boardHeight;
}
