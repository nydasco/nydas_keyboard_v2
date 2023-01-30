use <switch_complete.scad>


module all_buttons() {
    // index (dbl width)
        difference(){
        translate([-25, -10, 8.2])
            rotate([-10, 4, 4])
                column_dbl();
            // to accommodate access to the thumb switches
            difference() {
                translate([-40, -71, 0])
                    rotate([27, 0, -60])
                    resize([20,0,0])
                    end_wall();
                translate([-50, -10, 8.2])
                    rotate([-10, 4, 4])
                            column();
            }
        }
        
    // middle
    rotate([-10, 0, 0])
        column();
    // ring
    translate([22, -11, 8.2])
        rotate([-10, -4, -4])
        column();
    // pinky
    translate([46, -30, 11.7])
        rotate([-10, -4, -14])
        column();
    // pinky end wall
    translate([46, -30, 11.7])
        rotate([-10, -4, -14])
    translate([10,0,0])
        end_wall();
    // thumb
    translate([-40, -71, 0])
        rotate([27, 0, -60])
        column();
    // thumb end wall
    translate([-40, -71, 0])
        rotate([27, 0, -60])
    translate([10,0,0])
        end_wall();
}

difference() {
    union() {
        translate([0, 0, 7])
        rotate([0,7,0])
            all_buttons();
    }
    translate([0, 0, -25])
        cube([200,200,50], center = true);
}


$fn=360;

module end_wall(){
    difference(){
        translate([0,0,-20])
            cube([2,100,50], center = true);

            //offset to clear borders
            union(){
            translate([0,0,64.4])
                union(){
                    rotate([0,90,0])
                    rotate_extrude(angle = -40)
                    translate([57,0,0])
                        square([20, 22], center = true);
                    rotate([0,90,0])
                    rotate_extrude(angle = 40)
                    translate([57,0,0])
                        square([20, 22], center = true);
                }

            translate([0,-9,-31])
            rotate([-90,0,90])
            rotate_extrude(angle = -50)
            translate([65,0,0])
                square([20, 22], center = true);

            translate([0,9,-31])
            rotate([-90,0,-90])
            rotate_extrude(angle = -50)
            translate([65,0,0])
                square([20, 22], center = true);
        }
    }
}