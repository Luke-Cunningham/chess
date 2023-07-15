/// @description Variable Initialize 

//each piece will have a type associated with ti 
pieceType = noone;

//each piece will have a player it is associated with 
piecePlayer = noone;

//first move tracker
firstMove = true;

//Create a position tracker for where it is in the table 
xPos = noone;
yPos = noone;

//valid move structure
forCheck = false;
validMoves = ds_list_create(); //create an empty list to add cells to 
extraCheckMoves = ds_list_create();

//death tracker
isDead = false;