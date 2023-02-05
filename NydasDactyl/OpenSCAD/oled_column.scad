use <switch_complete.scad>

module oled_column() { 
    // curved top mount
    difference(){
        translate([0,0,64.4])
            union(){
                rotate([0,90,0])
                rotate_extrude(angle = -30)
                translate([65,0,0])
                    square([5, 22], center = true);
                rotate([0,90,0])
                rotate_extrude(angle = 30)
                translate([65,0,0])
                    square([5, 22], center = true);
            }
        
        cube([17.5, 51.0, 10.0], center = true);

    }
              // switch spaces

    // leg posts
    difference(){
    main_posts();
    translate([0,-39.5,0])
    rotate([60,0,0])
    scale([0.05,0.05,0.03])
    surface(file =  "parts/logo.png",  center = true);
    }

    // OLED Clip
    translate([0,0,1])
    difference() {
        cube([17.5, 51.0, 8.0], center = true);
        translate(v = [0, -13.65, -2.5]) {
            cube([12.5, 18.71, 8.0], center = true);
        }
        union() {
            translate(v = [0, 1.5, -0.35]) {
                cube([12.5, 25.0, 4.7], center = true);
            }
            translate(v = [0, 1.5, 4.05]) {
                hull() {
                    translate(v = [0, 0, -2.05]) {
                        cube([12.5, 25.0, 0.01], center = true);
                    }
                    cube([16.5, 29.0, 0.01], center = true);
                }
            }
        }
        translate(v = [0, 18.5, -2.5]) {
            cube([12.5, 9.01, 8.0], center = true);
        }
    }
}

oled_column();