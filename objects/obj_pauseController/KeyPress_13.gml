audio_play_sound(snd_menuSelect, 0, 0);

switch(menuLevel) {
	case 0:
		switch(menuPosition) {
			case 0:
				instance_activate_all();
				instance_destroy(id);
				break;

			case 1:
				menuLevel = 1;
				menuPosition = 0;
				break;

			case 2:
				menuLevel = 2;
				menuPosition = 0;
				break;
		}
		break;

	case 1:
		switch(menuPosition) {
			case 0:
				audio_stop_all();
				room_restart();
				break;

			case 1:
				menuLevel = 0;
				menuPosition = 0;
				break;
		}
		break;

	case 2:
		switch(menuPosition) {
			case 0:
				audio_stop_all();
				room_goto(rm_menu);
				break;

			case 1:
				menuLevel = 0;
				menuPosition = 0;
				break;
		}
		break;
}
