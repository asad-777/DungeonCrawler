// Calculate movement
var move_x = lengthdir_x(movement_speed, direction);
var move_y = lengthdir_y(movement_speed, direction);

// Check collision
if (!place_meeting(x + move_x, y + move_y, oWall)) {
    x += move_x;
    y += move_y;
}
else {
    // Reverse direction
    direction = (direction + 270) mod 360;
}