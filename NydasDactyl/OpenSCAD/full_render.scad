use <left_keyboard.scad>
use <right_keyboard.scad>

translate([-100,0,0])
    left_keyboard();
    
translate([100,0,0])
    right_keyboard();