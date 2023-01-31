use <switch_complete.scad>


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

difference() {
    union() {
        translate([0, 0, 7])
        rotate([0,7,0])
            all_buttons();
    }
    translate([0, 0, -25])
        cube([200,200,50], center = true);
}

