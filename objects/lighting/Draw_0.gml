if (!surface_exists(lighting_surface)) {
    lighting_surface = surface_create(room_width, room_height);
}
surface_set_target(lighting_surface);
draw_clear_alpha(c_black, 0.5);
gpu_set_blendmode(bm_subtract);
var _light_size = 150; 
with (obj_player) {
    draw_circle_color(x, y, _light_size, c_white, c_black, false);
}
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(lighting_surface, 0, 0);

