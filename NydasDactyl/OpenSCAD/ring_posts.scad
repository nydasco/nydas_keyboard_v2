module ring_posts() {
    //ring-top
    translate([36,21.5,0])
        rotate([0,0,86])
        cube([5, 22, 12]);
    //ring-bottom
    translate([30.5,-55.9,0])
        rotate([0,0,86])
        cube([5, 22, 11.1]);
}