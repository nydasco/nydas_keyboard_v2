use <switch_complete.scad>


$fn=360;
 

module all_buttons() {
    difference() {
        union() {
        // index (dbl width)
        translate([-25, -10, 8.2])
            rotate([-10, 4, 4])
            column_dbl();
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
            column();
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
    translate([-35,-40,10])
        rotate([0,90,0])
        cylinder(15,5,5,true);
    translate([-25,-50,10])
        rotate([0,90,90])
        cylinder(15,5,5,true);
    translate([10,-30,10])
        rotate([0,90,0])
        cylinder(15,5,5,true);
    translate([30,-45,10])
        rotate([0,90,0])
        cylinder(15,4,4,true);
}



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
    translate([0, 0, -23])
        cube([200,200,50], center = true);
        wiring_passthrough();
}
ground_floor();