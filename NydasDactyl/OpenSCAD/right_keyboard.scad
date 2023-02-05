use <main_board.scad>
use <switch_complete.scad>
use <right_thumb.scad>
use <oled_column.scad>
use <wiring_passthrough.scad>
use <base_plate.scad>
use <extras.scad>

$fn=360;

module all_buttons() {
    difference() {
        union() {
        // index (dbl width)
        translate([-25, -10, 8.2])
            rotate([-10, 4, 4])
            column_dbl_encoder();
        translate([-65,-22,0])
            rotate([0, -7, 4])
            oled_column();
            
        // middle
            rotate([-10, 0, 0])
                column(full=true,wall_left = true, wall_right = true);
            };

        // remove overlap of walls
        translate([-40, -71, 0])
            rotate([27, 0, -60])
            resize([20,0,0])
            end_wall();
        translate([0,-50,0])
            cube([20,30,20], center = true);
    };
    // ring
    difference(){
        translate([22, -11, 8.2])
            rotate([-10, -4, -4])
            column(full=true,wall_left = true, wall_right = true);
        translate([10,-60,0])
        cube([20,30,20], center = true);
    }
    // pinky
    translate([46, -30, 11.7])
        rotate([-10, -4, -14])
        column(full=true,wall_left = true, wall_right = true);
    // thumb
    difference() {
        translate([-40, -71, 0])
            rotate([27, 0, -60])
            right_thumb();
        // remove overlap of walls
        union(){
        rotate([-10, 0, 0])
            resize([20,0,0])
            end_wall();
    translate([46, -30, 11.7])
        rotate([-10, -4, -14])
            resize([20,0,0])
            end_wall();
    translate([22, -11, 8.2])
        rotate([-10, -4, -4])
            resize([20,0,0])
            end_wall();
        }
    }
}


module main_body() {
difference() {
    union() {
        translate([0, 0, 7])
        rotate([0,7,0])
            all_buttons();
        // fix for passthrough to pinky which leaves a gap due to splay
        translate([32,-45,10])
            rotate([0,90,0])
            cylinder(4,5,5,true);
    }
    translate([0, 0, -33])
        cube([200,200,70], center = true);
        wiring_passthrough();
    
        
    translate([-40,32,10])
        rotate([90,0,0])
        usb();
        
    
    translate([-67,14,10])
        rotate([270,0,0])
        trrs();
}
}


module right_keyboard() {
    main_body();
    ground_floor(left=false);

 }


right_keyboard();

