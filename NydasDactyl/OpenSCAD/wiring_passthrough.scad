module wiring_passthrough() {

    translate([-20,-50,10])
        rotate([0,90,90])
        cylinder(20,5,5,true);
    translate([15,-28,10])
        rotate([0,90,0])
        cylinder(20,5,5,true);
    translate([30,-45,10])
        rotate([0,90,0])
        cylinder(5,4,4,true);
    translate([-50,-10,0])
        cube([35,45,20], center = true);
}

wiring_passthrough();