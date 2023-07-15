
draw_set_font(fnt_Victory);
var text = noone;

if(global.WinnerPlayer == 1){
	
	text = "PLAYER 1 WINS";
	draw_text_color(room_width / 2, room_height / 3, text, c_white, c_white, c_white, c_white, 1);
	
}else if(global.WinnerPlayer == 2){
	
	text = "PLAYER 2 WINS";
	draw_text_color(room_width / 2, room_height / 3, text, c_white, c_white, c_white, c_white, 1);	
}else if(global.Winner == "Stalemate"){
	text = "STALEMATE";
	draw_text_color(room_width / 2, room_height / 3, text, c_white, c_white, c_white, c_white, 1);	
}else if(global.Winner == "Tie"){
	text = "DRAW";
	draw_text_color(room_width / 2, room_height / 3, text, c_white, c_white, c_white, c_white, 1);	
}

if(global.WinnerPlayer == 2 || global.WinnerPlayer == 1){
	text = "Press Enter to Play Again";
	draw_text_color(room_width / 2, 2*room_height / 3, text, c_white, c_white, c_white, c_white, 1);	

	text = "Press Escape to Return to Menu";
	draw_text_color(room_width / 2, 4* room_height / 5, text, c_white, c_white, c_white, c_white, 1);
	
}else{
	text = "Press Enter to Play Again";
	draw_text_color(room_width / 2, 2*room_height / 3, text, c_black, c_black, c_black, c_black, 1);	

	text = "Press Escape to Return to Menu";
	draw_text_color(room_width / 2, 4* room_height / 5, text, c_black, c_black, c_black, c_black, 1);
}