
//Function to check if the player has clicked on the board and not anywhere else on the screen
function didClickBoard(argument0, argument1, argument2){
	
	boardGrid = argument0;
	clickedX = argument1;
	clickedY = argument2;
	
	topLeftSquare = boardGrid[# 0, 0]; //is the zero zero object
	bottomRightSquare = boardGrid[# ds_grid_width(boardGrid) - 1, ds_grid_height(boardGrid) - 1]; //get the bottom right index
	
	//since the squares are aligned based on top left corner, we will use the x and y of the object as the lower bounds
	lowerX = topLeftSquare.x;
	lowerY = topLeftSquare.y;
	
	//Get the upper bounds to check 
	upperX = bottomRightSquare.x + bottomRightSquare.sprite_width; //get the left side of the object
	upperY = bottomRightSquare.y + bottomRightSquare.sprite_height; //get the left side of the object
	
	//Now check if the clicked x and y are within the boundary that we expect...
	if(clickedX >= lowerX and clickedX <= upperX and clickedY >= lowerY and clickedY <= upperY){
		return true; //return true as the player clicked prpoerly in the board
	}
	
	return false; // if we don't return true from above, we will return false as we clicekd outside of the bounds of the board
}