module keycap(keycap_width = 17.5, keycap_depth = 18) {
    hull() {
        //keycap base bottom
        translate(v = [0, 0, 0.05]) {
            linear_extrude(center = true, convexity = 0, height = 0.1) {
                polygon(points = [[keycap_width/2, keycap_depth/2], [keycap_width/2, -keycap_depth/2], [-keycap_width/2, -keycap_depth/2], [-keycap_width/2, keycap_depth/2], [keycap_width/2, keycap_depth/2]]);
            }
        }
        //keycap base top
        translate(v = [0, 0, 2.05]) {
            linear_extrude(center = true, convexity = 0, height = 0.1) {
                polygon(points = [[keycap_width/2, keycap_depth/2], [keycap_width/2, -keycap_depth/2], [-keycap_width/2, -keycap_depth/2], [-keycap_width/2, keycap_depth/2], [keycap_width/2, keycap_depth/2]]);
            }
        }
        //keycap top
        translate(v = [0, 0, 3.55]) {
            linear_extrude(center = true, convexity = 0, height = 0.1) {
                polygon(points = [[(keycap_width-3)/2, (keycap_depth-3)/2], [(keycap_width-3)/2, -(keycap_depth-3)/2], [-(keycap_width-3)/2, -(keycap_depth-3)/2], [-(keycap_width-3)/2, (keycap_depth-3)/2], [(keycap_width-3)/2, (keycap_depth-3)/2]]);
            }
        }
     }
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

module switch_holder() {
    union(){
        difference(){
            cube([18.8, 17.8, 5], center = true);
            cube([13.2, 13.2, 5], center = true);
            translate([0,0,-1])
                cube([18.8, 17.8, 3], center = true);
        }
        translate([7.316373,7.080354,-2])
            cylinder(4, 1, $fs = 0.01);
    }
    translate([0,0,3])
        keycap();
}

switch_holder();

module main_posts() {
    difference(){
        // main posts
        union(){
            translate([0,-19,-31])
            rotate([-90,0,90])
            rotate_extrude(angle = -40)
            translate([65,0,0])
                square([5, 22], center = true);

            translate([0,19,-31])
            rotate([-90,0,-90])
            rotate_extrude(angle = -40)
            translate([65,0,0])
                square([5, 22], center = true);
        };
        // cleanup to remove overlap
        translate([0,0,70.1])
        union(){
            rotate([0,90,0])
            rotate_extrude(angle = -40)
            translate([65,0,0])
                square([5, 22], center = true);
            rotate([0,90,0])
            rotate_extrude(angle = 40)
            translate([65,0,0])
                square([5, 22], center = true);
        }
    }   
    
    translate([10,0,0])
        end_wall();
    
    translate([-10,0,0])
        end_wall();
}

module column() {
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
        // placeholder for switches
        cube([18.8, 17.8, 10], center = true);
        
        translate([0, -22, 4])
            rotate([-20, 0, 0])
            cube([18.8, 17.8, 10], center = true);
        
        translate([0, 22, 4])
            rotate([20, 0, 0])
            cube([18.8, 17.8, 10], center = true);
    }
    // switch spaces
    switch_holder();

    translate([0, -22, 3.96])
        rotate([-20, 0, 0])
        switch_holder();

    translate([0, 22, 3.96])
        rotate([20, 0, 0])
        switch_holder();
    // leg posts
    main_posts();
}

module column_dbl() {
    column();
    translate([-20,0,0])
    column();
}
module main_posts_dbl() {
    main_posts();
    translate([-20,0,0])
    main_posts();
}



column();