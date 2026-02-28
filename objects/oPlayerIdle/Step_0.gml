// Reset speeds
x_speed = 0;
y_speed = 0;

// Horizontal movement
if (keyboard_check(vk_right)) {
    x_speed = movement_speed;
} else if (keyboard_check(vk_left)) {
    x_speed = -movement_speed;
}

// Vertical movement
if (keyboard_check(vk_down)) {
    y_speed = movement_speed;
} else if (keyboard_check(vk_up)) {
    y_speed = -movement_speed;
}

// Apply movement
// Horizontal Collision
if (place_meeting(x + x_speed, y, oWall)) {
    // Move as close as possible to the wall
    while (!place_meeting(x + sign(x_speed), y, oWall)) {
        x += sign(x_speed);
    }
    x_speed = 0;
}
x += x_speed;

// Vertical Collision
if (place_meeting(x, y + y_speed, oWall)) {
    // Move as close as possible to the wall
    while (!place_meeting(x, y + sign(y_speed), oWall)) {
        y += sign(y_speed);
    }
    y_speed = 0;
}
y += y_speed;
if keyboard_check(vk_right) {

    x_speed = movement_speed; 

    image_xscale = 1; // flip heidi's sprite so she faces right

} else if keyboard_check(vk_left) {

    x_speed = -movement_speed; 

    image_xscale = -1; // reset her sprite so she faces left

}