use <switch_complete.scad>
use <right_thumb.scad>

track_ball_offset = [10,30,6];
track_ball_rotation = [23,0,0];

module base_plate(left) {
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
    if(left){
        difference() {
            union(){
            translate([-40, -71, 0])
                rotate([27, 0, -60])
                main_posts(); 
            }
            // remove overlap of walls
            rotate([-10, 0, 0])
                resize([20,0,0])
                end_wall();
        }
    }
    else {
        difference() {
            union(){
            translate([-40, -71, 0])
                rotate([27, 0, -60])
                main_posts(); 
               if(left) {}
              else { 
            translate([-40, -71, 0])
                rotate([27, 0, -60])
                
            translate([10,47.9,-35.5])
                rotate(track_ball_rotation)
                difference(){
                    cylinder(50,25,25);
                        
                    cylinder(55,17,20);
                } 
            }
            }
            // remove overlap of walls
            rotate([-10, 0, 0])
                resize([20,0,0])
                end_wall();
        }
        }
    
}

// ground floor for base
module ground_floor(left) {
    difference() {
        union() {
            translate([0, 0, 7])
                rotate([0,7,0])
                base_plate(left);
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
            if(left){
                
            }
            else{
            translate([8, -54, 0])
                cube([40,40,2], center = true);
                
            }
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
            translate([0, 0, 32])
                cube([200,200,60], center = true);
        }
        
    }
    
}

ground_floor(left=false);
