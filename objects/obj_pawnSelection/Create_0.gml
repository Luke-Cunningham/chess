
x = room_width / 2;
y  = room_height / 2;
depth = -10;

borderDistanceTopDown = sprite_height / 4;
spaceDistanceTopDown = sprite_height / 5;

menuOption[0, 0] = "Queen"; 
menuOption[0, 1] = "Rook"; 
menuOption[0, 2] = "Bishop"; 
menuOption[0, 3] = "Knight"; 
menuOption[1, 0] = "YES"; 
menuOption[1, 1] = "NO"; 

menuPosition = 0; 
menuLevel = 0;
menuSize = array_length(menuOption[menuLevel]); 
selectedPiece = noone;
global.aiLocked = true;