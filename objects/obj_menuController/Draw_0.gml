// Draw background sprite
draw_sprite_ext(sprite_index, image_index, room_width / 2, room_height / 2, 1, 1, 0, c_white, .8);

// Draw menu options
draw_set_font(fnt_menuText); 
draw_set_halign(fa_center);
var base_y = y - (sprite_height / 2) + borderDistanceTopDown;
for(var i = 0; i < menuSize; i+= 1){
    draw_set_color((menuPosition == i) ? c_red : c_black);
    draw_text(x, base_y + spaceDistanceTopDown * i, menuOption[menuLevel, i]);
}

// Draw title based on current menu level
draw_set_color(c_black);
var title = "";
switch(menuLevel){
	case 0:
		title = "Main Menu";
		break;
    case 1:
        title = "Choose Your Pieces:";
        break;
    case 2:
        if(!secondSelect){
            title = "Select AI Difficulty:";
        }
        break;
    case 99:
        title = "READY?";
        break;
    default:
        title = "Unexpected menu";
        break;
}
draw_text(x , y - (4* sprite_height / 10), title);

// Draw game settings if confirmation screen
if(menuLevel == 99){
    draw_set_font(fnt_menuSmall);
    var settings_y = y + sprite_height / 8;

    var gamemode = (global.selectedGamemode == 0) ? "Single Player" : "Multiplayer";

    draw_text(x, settings_y, "GAME SETTINGS");
    draw_text(x, settings_y + spaceDistanceTopDown / 3, "Gamemode: " + gamemode);
    
    // Check if playerSelection[0] is initialized
    if (!is_undefined(global.playerSelection[0]) && global.playerSelection[0] != noone) {
        draw_text(x, settings_y + 2 * spaceDistanceTopDown / 3, "P1 Team: " + global.playerSelection[0]);
    }
    
    // Check if playerSelection[1] is initialized
    if(!is_undefined(global.playerSelection[1]) && global.playerSelection[1] != noone){
        draw_text(x, settings_y + spaceDistanceTopDown, "P2 Team: " + global.playerSelection[1]);
    }

    // If Single Player mode, draw AI difficulty
    if(global.selectedGamemode == 0){
        var aiMode = (global.AIDIFFICULTY == 0) ? "Easy" : "Normal";
        draw_text(x, settings_y + 3 * spaceDistanceTopDown / 3, "AI: " + aiMode);
    }
}
