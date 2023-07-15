
menuSize = array_length(menuOption[menuLevel]);
	if(menuPosition >= menuSize){ 
		menuPosition = 0; 
	}else if(menuPosition < 0){ 
		menuPosition = menuSize - 1; 
	}
	