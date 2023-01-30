module thumb_posts() {
    //thumb-top
    translate([3,-56,0])
        rotate([0,0,30])
        cube([5, 22, 14]);
    //thumb-bottom
    translate([-66.9,-96,0])
        rotate([0,0,30])
        cube([5, 22, 9]);
}