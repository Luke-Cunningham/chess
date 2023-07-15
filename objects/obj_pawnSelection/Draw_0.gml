draw_sprite_ext(sprite_index, image_index, room_width / 2, room_height / 2, 1, 1, 0, c_white, .8);

draw_set_font(fnt_menuText); 
draw_set_halign(fa_center);

for(var i = 0; i < menuSize; i+= 1){
	
	if(menuPosition == i){ 
		draw_set_color(c_red); 
	}else{
		draw_set_color(c_black);
	}

	draw_text(x , y - (sprite_height / 2) + borderDistanceTopDown + spaceDistanceTopDown * i, menuOption[menuLevel, i]); 
}

draw_set_color(c_black);
switch(menuLevel){
	
	case 0:
		draw_text(x , y - (4* sprite_height / 10)  , "Promotion");
		break;
	
	case 1:
		draw_text(x , y - (4* sprite_height / 10)  , "Confirm Promotion");
		break;
}
