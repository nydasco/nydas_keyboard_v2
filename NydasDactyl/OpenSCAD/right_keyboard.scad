use <main_board.scad>
use <switch_complete.scad>
use <right_thumb.scad>

$fn=360;
 
module oled_column() { 
    // curved top mount
    difference(){
        translate([0,0,64.4])
            union(){
                rotate([0,90,0])
                rotate_extrude(angle = -30)
                translate([65,0,0])
                    square([5, 22], center = true);
                rotate([0,90,0])
                rotate_extrude(angle = 30)
                translate([65,0,0])
                    square([5, 22], center = true);
            }
        
        cube([17.5, 51.0, 10.0], center = true);

    }
              // switch spaces

    // leg posts
    main_posts();

    // OLED Clip
    translate([0,0,1])
    difference() {
        cube([17.5, 51.0, 8.0], center = true);
        translate(v = [0, -13.65, -2.5]) {
            cube([12.5, 18.71, 8.0], center = true);
        }
        union() {
            translate(v = [0, 1.5, -0.35]) {
                cube([12.5, 25.0, 4.7], center = true);
            }
            translate(v = [0, 1.5, 4.05]) {
                hull() {
                    translate(v = [0, 0, -2.05]) {
                        cube([12.5, 25.0, 0.01], center = true);
                    }
                    cube([16.5, 29.0, 0.01], center = true);
                }
            }
        }
        translate(v = [0, 18.5, -2.5]) {
            cube([12.5, 9.01, 8.0], center = true);
        }
    }
}




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
            column();
        };
        // remove overlap of walls
        translate([-40, -71, 0])
            rotate([27, 0, -60])
            resize([20,0,0])
            end_wall();
    };
    // ring
    translate([22, -11, 8.2])
        rotate([-10, -4, -4])
        column();
    // pinky
    translate([46, -30, 11.7])
        rotate([-10, -4, -14])
        column();
    // thumb
    difference() {
        translate([-40, -71, 0])
            rotate([27, 0, -60])
            right_thumb();
        // remove overlap of walls
        rotate([-10, 0, 0])
            resize([20,0,0])
            end_wall();
    }
}


module base_plate() {
    difference() {
        union() {
        // index (dbl width)
        translate([-25, -10, 8.2])
            rotate([-10, 4, 4])
            main_posts_dbl(); 
        translate([-65,-22,0])
            rotate([0, -7, 4])
            main_posts();
        // middle
        rotate([-10, 0, 0])
            main_posts(); 
        };
        // remove overlap of walls
        translate([-40, -71, 0])
            rotate([27, 0, -60])
            resize([20,0,0])
            end_wall();
    };
    // ring
    translate([22, -11, 8.2])
        rotate([-10, -4, -4])
        main_posts(); 
    // pinky
    translate([46, -30, 11.7])
        rotate([-10, -4, -14])
        main_posts(); 
    // thumb
    difference() {
        translate([-40, -71, 0])
            rotate([27, 0, -60])
            main_posts(); 
        // remove overlap of walls
        rotate([-10, 0, 0])
            resize([20,0,0])
            end_wall();
    }
}



// ground floor for base
module ground_floor() {
    difference() {
        union() {
            translate([0, 0, 7])
                rotate([0,7,0])
                base_plate();
            // index
            translate([-37, -10, 0])
                rotate([0, 0, 4])
                cube([40,76,2], center = true);
            translate([-37, -30, 0])
                rotate([0, 0, 4])
                cube([40,76,2], center = true);
            // OLED
            translate([-54, -20, 0])
                rotate([0, 0, 4])
                cube([40,85,2], center = true);
            // midle
            cube([20,74,2], center = true);
            translate([0,-10,0])
                cube([20,74,2], center = true);
            // ring
            translate([22, -11, 0])
                rotate([0, 0, -4])
                cube([20,74,2], center = true);
            translate([22, -21, 0])
                rotate([0, 0, -4])
                cube([20,74,2], center = true);
            // pinky
            translate([46, -30, 0])
                rotate([0, 0, -14])
                cube([20,74,2], center = true);
            translate([44, -40, 0])
                rotate([0, 0, -14])
                cube([20,74,2], center = true);
            // thumb
            translate([-40, -71, 0])
                rotate([0, 0, -60])
                cube([20,74,2], center = true);
            translate([-27, -63, 0])
                rotate([0, 0, -60])
                cube([20,74,2], center = true);
            // splay joins
            difference(){
                union(){
                translate([-15,-5,0])
                    cube([10,75.5,5], center = true);
                translate([12,-5,0])
                    cube([5,75,5], center = true);
                translate([34,-23,0])
                    rotate([0,0,-10])
                    cube([12,74.1,5], center = true);
                }
                //get bevel between fingers
                union(){
                translate([-15.2,35,0])
                    cylinder(12,4,4,center = true);
                translate([13.2,33.7,0])
                    cylinder(12,3,3,center = true);
                translate([41,16,0])
                    cylinder(12,6,6,center = true);
                }
            }
        }
        
        union() {
            translate([0, 0, -25])
                cube([200,200,50], center = true);
            translate([0, 0, 22])
                cube([200,200,40], center = true);
        }
    }
}


module wiring_passthrough() {

    translate([-25,-50,10])
        rotate([0,90,90])
        cylinder(15,5,5,true);
    translate([10,-30,10])
        rotate([0,90,0])
        cylinder(15,5,5,true);
    translate([30,-45,10])
        rotate([0,90,0])
        cylinder(15,4,4,true);
    translate([-50,-10,0])
        cube([35,45,20], center = true);
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
}
}


module right_keyboard() {
    main_body();
    //ground_floor();



 }


right_keyboard();

