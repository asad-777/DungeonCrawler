//// RESET SPEED
x_speed = 0;
y_speed = 0;
if (keyboard_check(vk_right)) {
	with (obj_game_controller) {
    game_state = "playing";
}
    x_speed = movement_speed;
    image_xscale = 1;
}
else if (keyboard_check(vk_left)) {
		with (obj_game_controller) {
    game_state = "playing";
}
    x_speed = -movement_speed;
    image_xscale = -1;
}
if (keyboard_check(vk_down)) {
		with (obj_game_controller) {
    game_state = "playing";
}
    y_speed = movement_speed;
}
else if (keyboard_check(vk_up)) {
		with (obj_game_controller) {
    game_state = "playing";
}
    y_speed = -movement_speed;
}
if (!place_meeting(x + x_speed, y, oWall) && obj_game_controller.game_state == "playing") {
    x += x_speed;
}
if (!place_meeting(x, y + y_speed, oWall) && obj_game_controller.game_state == "playing") {
    y += y_speed;
}
if (x_speed != 0 || y_speed != 0) {
    sprite_index = sPlayerWalk;
} else {
    sprite_index = sPlayerIdle;
}
if (place_meeting(x, y, oMonster)) {
with (obj_game_controller) {
    game_state = "game_over";
}
instance_destroy(); // Destroy the player so they can't move anymore

}
if (place_meeting(x, y, oSpikes)) {
   with (obj_game_controller) {
    game_state = "game_over";
}
instance_destroy(); 
}

if (place_meeting(x, y, oExit)) {
   with (obj_game_controller) {
    game_state = "win";
}
instance_destroy(); 
}
