
x = room_width / 2;
y = room_height / 2;

borderDistanceTopDown = sprite_height / 4;
spaceDistanceTopDown = sprite_height / 5;

menuOption[0, 0] = "Continue Game"; 
menuOption[0, 1] = "Restart Game"; 
menuOption[0, 2] = "Quit to Menu"; 

menuOption[1, 0] = "YES";
menuOption[1, 1] = "NO"; 

menuOption[2, 0] = "YES"; 
menuOption[2, 1] = "NO";

menuPosition = 0; 
menuLevel = 0;
menuSize = array_length(menuOption[menuLevel]); 