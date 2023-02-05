
module usb() {
    union(){
        
        translate([-4.2,0,0])
        cylinder(10,1.4,1.4);
        translate([0,0,5])
        cube([8.4,2.8,10], center = true);
        
        translate([4.2,0,0])
        cylinder(10,1.4,1.4);
    }
}

module trrs() {
    cube([10,10,5], center = true);
    cylinder(10,d=3.7);
}