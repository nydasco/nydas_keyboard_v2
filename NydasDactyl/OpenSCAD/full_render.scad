use <main_board.scad>
use <left_keyboard.scad>

translate([-100,0,0])
mirror([180,0,0])
union(){
main_body();
//translate([0,0,0])
    ground_floor();
}

translate([100,0,0])
union(){
main_body();
//translate([0,0,0])
    ground_floor();
}