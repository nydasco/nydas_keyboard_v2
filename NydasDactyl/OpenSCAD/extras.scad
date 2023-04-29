
module usb() {
    union(){
        
        translate([-5.2,0,0])
            cylinder(10,1.9,1.9);
        
        translate([0,0,5])
            cube([10.4,3.8,10], center = true);
        
        translate([5.2,0,0])
            cylinder(10,1.9,1.9);
    }
}

module trrs() {
    cube([7,7,5], center = true);
    cylinder(10,d=4.7);
}

