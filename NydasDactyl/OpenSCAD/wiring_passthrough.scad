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