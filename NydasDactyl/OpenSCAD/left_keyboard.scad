use <main_board.scad>
use <switch_complete.scad>
use <extras.scad>
use <base_plate.scad>
use <oled_column.scad>
use <wiring_passthrough.scad>
$fn=360;
 

module all_buttons() {
    difference() {
        union() {
        // index (dbl width)
        translate([-21, -9, 8.2])
            rotate([-10, 4, 4])
            column_dbl_encoder();
        translate([-60,-22,0])
            rotate([0, -7, 4])
            oled_column(logo=false);
            
        // middle
        rotate([-3, 0, 0])
            column(full=true,wall_left = true, wall_right = true);
        };
        // remove overlap of walls
        translate([-32, -75, 0])
            rotate([27, 0, -60])
            resize([20,0,0])
            end_wall();
    };
    // ring
    translate([21, -11, 8.2])
        rotate([-10, -4, -4])
        column(full=true,wall_left = true, wall_right = true);
    // pinky
    translate([42, -30, 11.7])
        rotate([-10, -4, -14])
        column(full=true,wall_left = true, wall_right = true);
    // thumb
    difference() {
        translate([-35, -65, 0])
            rotate([27, 0, -60])
            column(full=true,wall_left = true, wall_right = true);
        // remove overlap of walls
    translate([3,-35,-4])
        rotate([90,0,0])
        cylinder(10,5,5, center = true);
    }

}


module main_body() {
difference() {
    union() {
        translate([0, 0, 7])
        rotate([0,7,0])
            all_buttons();
        // fix for passthrough to pinky which leaves a gap due to splay
        translate([28,-45,10])
            rotate([0,90,0])
            cylinder(1,5,5,true);
    }
    union(){
    translate([0, 0, -33])
        cube([200,200,70], center = true);
        wiring_passthrough();
        
    translate([-40,32,10])
        rotate([90,0,0])
        usb();
        
    
    translate([-63,12,10])
        rotate([280,0,0])
        trrs();
    }
    
}
}

module left_keyboard(){
mirror([180,0,0])
    union() {
        main_body();
        //ground_floor(left=true);
    }
}

left_keyboard();
