use <obiscad/bevel.scad>
use <obiscad/attach.scad>

use <switch_complete.scad>
use <middle_posts.scad>
use <index_posts.scad>
use <ring_posts.scad>
use <pinky_posts.scad>
use <thumb_posts.scad>


difference() {
    union() {
        translate([0, 0, 7])
        rotate([0,7,0])
            all_buttons();

        middle_posts();
        index_posts();
        ring_posts();
        pinky_posts();
        thumb_posts();
    }
    translate([0, 0, -25])
        cube([200,200,50], center = true);
}




module all_buttons() {
    // index 1
    translate([-25, -10, 7])
        rotate([-10, 4, 4])
        column_dbl();
    // middle
    rotate([-10, 0, 0])
        column();
    // ring
    translate([22, -11, 7])
        rotate([-10, -4, -4])
        column();
    // pinky
    translate([46, -30, 10.5])
        rotate([-10, -4, -14])
        column();
    // thumb
    translate([-40, -68, 0])
        rotate([27, 0, -60])
        column();
}

module thumb() {
switch_complete();
    translate([0, 20, -4])
        rotate([-20, 0, 0])
        switch_complete();
    translate([0, -20, -4])
        rotate([20, 0, 0])
        switch_complete();
}