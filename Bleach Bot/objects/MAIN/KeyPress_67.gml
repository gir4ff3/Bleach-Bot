if(keyboard_check(vk_shift)){
	collate = !collate;
	save_options();
}else{
	dialogue_modifier = "";
	if(show_question("Would you like to enter rgb format?")){
		event_user(0);
	}else if(show_question("Would you like to enter hex format?")){
		event_user(1);
	}
	save_color();
}