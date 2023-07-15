global.Winner = noone;
global.WinnerPlayer = noone;
global.gameOver = false;

var pieceTypes = ["w", "q", "b", "k", "r", "p"];

p1Sprites = [];
for (var i = 0; i < array_length_1d(pieceTypes); i++) {
    p1Sprites[i] = asset_get_index("Chess_" + pieceTypes[i] + "lt45");
}

p2Sprites = [];
for (var i = 0; i < array_length_1d(pieceTypes); i++) {
    p2Sprites[i] = asset_get_index("Chess_" + pieceTypes[i] + "dt45");
}

boardLayout = load_csv("defaultLayout.csv"); 
boardTiles = ds_grid_create(8, 8);

global.xOffset = 0;
global.yOffset = 0;
draw_board();

p1_pieces = [];
p2_pieces = [];
pieceLocations = ds_grid_create(8, 8);

loadPieces(boardLayout, boardTiles, p1Sprites, p2Sprites, pieceLocations);
global.boardHeight = 7;
global.boardWidth = 7;

for(i = 0; i <= global.boardWidth; i++){
	for(j = 0; j <= global.boardHeight; j++){
		if(pieceLocations[# i, j] == 0){
			pieceLocations[# i, j] = noone;
		}
	}
}

global.currentPlayerTurn = 1;
currentlySelectedPiece = false;
selectedPiece = noone;
promotionPiece = noone;
p1_squares = [];
p2_squares = [];
p1_dead = [];
p2_dead = [];
