// 1. Get GUI Dimensions
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// 2. Set Universal Text Settings
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 3. Handle Different Game States
switch (game_state) 
{
    case "start":
        // --- BLACK OVERLAY ---
        draw_set_alpha(0.8);
        draw_set_color(c_black);
        draw_rectangle(0, 0, _gui_w, _gui_h, false);
        
        // --- PULSING TEXT ANIMATION ---
        timer += 0.04; // Increments every frame
        var _pulse = abs(sin(timer)); // Creates a 0 to 1 loop
        
        draw_set_alpha(_pulse);
        draw_set_color(c_white);
        draw_text_transformed(_gui_w / 2, _gui_h / 2, "PRESS ANY KEY TO START", 2, 2, 0);
        
        // --- SUBTEXT ---
        draw_set_alpha(1.0);
        draw_text(_gui_w / 2, _gui_h / 2 + 60, "Use Arrow Keys to Move");
        break;

    case "playing":
        // You can leave this empty, or draw a HUD (Score, Health, etc.) here
        break;

    case "game_over":
        // --- DIM THE BACKGROUND ---
        draw_set_alpha(0.7);
        draw_set_color(c_black);
        draw_rectangle(0, 0, _gui_w, _gui_h, false);
        
        // --- GAME OVER TEXT ---
        draw_set_alpha(1.0);
        draw_set_color(c_red);
        draw_text_transformed(_gui_w / 2, _gui_h / 2 - 20, "GAME OVER", 3, 3, 0);
        
        // --- RESTART INSTRUCTION ---
        draw_set_color(c_white);
        draw_text(_gui_w / 2, _gui_h / 2 + 60, "Press 'R' to Try Again");
        break;

    case "win":
        // --- DIM THE BACKGROUND ---
        draw_set_alpha(0.7);
        draw_set_color(c_black);
        draw_rectangle(0, 0, _gui_w, _gui_h, false);
        
        // --- YOU WON TEXT ---
        draw_set_alpha(1.0);
        draw_set_color(c_yellow);
        draw_text_transformed(_gui_w / 2, _gui_h / 2 - 20, "YOU ESCAPED!", 3, 3, 0);
        
        // --- RESTART INSTRUCTION ---
        draw_set_color(c_white);
        draw_text(_gui_w / 2, _gui_h / 2 + 60, "Press 'R' to Play Again");
        break;
}

// Always reset alpha at the end of a Draw event to avoid bugs elsewhere
draw_set_alpha(1.0);