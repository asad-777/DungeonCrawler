// Restart logic
if (game_state != "playing" && keyboard_check_pressed(ord("R"))) {
    room_restart();
}