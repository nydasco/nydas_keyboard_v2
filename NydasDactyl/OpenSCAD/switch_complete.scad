use <keycap.scad>

incl_keycap = false;
incl_encoder = false;


wall_left = true;
wall_right = true;
full = true;

module end_wall(){
    difference(){
        translate([-0.5,0,-10])
            cube([1,100,50], center = true);

            //offset to clear borders
            union(){
                translate([0,0,64.4])
                    union(){
                        rotate([0,90,0])
                        union(){
                            rotate_extrude(angle = -40)
                            translate([57,0,0])
                                square([20, 22], center = true);
                            rotate_extrude(angle = 40)
                            translate([57,0,0])
                                square([20, 22], center = true);
                        }
                    }

                translate([0,-9,-31])
                rotate([-90,0,90])
                rotate_extrude(angle = -50)
                translate([65,0,0])
                    square([25, 12], center = true);

                translate([0,9,-31])
                rotate([-90,0,-90])
                rotate_extrude(angle = -50)
                translate([65,0,0])
                    square([25, 12], center = true);
        }
    }
}

module switch_holder(keycap = true) {
    difference(){
        cube([18.9, 17.9, 5], center = true);
        cube([13.2, 13.2, 5], center = true);
        translate([0,0,-1])
            cube([18.9, 17.9, 3], center = true);
        translate([0,0,-2])
            cube([15,20,2], center = true);
    }
    if(keycap){
    translate([0,0,3])
        keycap();
    }
}

module main_posts(wall_left = true, wall_right = true) {
    difference(){
        // main posts
        union(){
            translate([0,-19,-31])
            rotate([-90,0,90])
            rotate_extrude(angle = -40)
            translate([62,0,0])
                square([3.5, 20], center = true);

            translate([0,19,-31])
            rotate([-90,0,-90])
            rotate_extrude(angle = -40)
            translate([62,0,0])
                square([3.5, 20], center = true);
        };
        // cleanup to remove overlap
        translate([0,0,66.6])
        union(){
            rotate([0,90,0])
            rotate_extrude(angle = -40)
            translate([62,0,0])
                square([5, 22], center = true);
            rotate([0,90,0])
            rotate_extrude(angle = 40)
            translate([62,0,0])
                square([5, 22], center = true);
        }
    }   
    if(wall_left) {
    translate([10,0,0])
        end_wall();
    }
    if(wall_right) {
    translate([-9,0,0])
        end_wall();
    }
}

module column(full=true,wall_left = wall_left, wall_right = wall_right) {
    // curved top mount
    difference(){
        translate([0,0,64.4])
            union(){
                rotate([0,90,0])
                rotate_extrude(angle = -27)
                translate([65,0,0])
                    square([5, 20], center = true);
                rotate([0,90,0])
                rotate_extrude(angle = 27)
                translate([65,0,0])
                    square([5, 20], center = true);
            }
        // placeholder for switches
        cube([18.8, 17.8, 10], center = true);
        
        translate([0, -19.5, 4])
            rotate([-20, 0, 0])
            cube([18.8, 17.8, 10], center = true);
        
        if (full == true){
            translate([0, 19.5, 4])
                rotate([20, 0, 0])
                cube([18.8, 17.8, 10], center = true);
        }
       
         translate([0,0,-4])
            cube([15, 40, 10], center = true);

    }
    
    // switch spaces
    translate([0, 0, 0.5])
        switch_holder(keycap = incl_keycap);

    translate([0, -19.5, 3.3])
        rotate([-17.1, 0, 0])
        switch_holder(keycap = incl_keycap);

    if (full == true){
        
        translate([0, 19.5, 3.3])
            rotate([17.1, 0, 0])
            switch_holder(keycap = incl_keycap);
    }
    // leg posts
    main_posts(wall_left = wall_left, wall_right = wall_right);
    
}

module encoder() {
    difference(){
        union(){
            translate([-20,-34,0])
                rotate([-33,0,0])
                cube([14,5,15], center = true);

            translate([-22,-36,-5])
                rotate([-33,0,0])
                cylinder(10,5,5);
        }

            translate([-10,-36,0])
                rotate([-33,0,0])
                cube([14,2,18], center = true);
    }
}

module main_posts_dbl() {
    main_posts();
    translate([-20,0,0])
    main_posts();
}

module column_dbl_encoder(inc_encoder=false) {
    column(full=true,wall_left = true, wall_right = false);
    translate([-20,0,0])
    difference(){
        column(full=true,wall_left = false, wall_right = true);
        translate([20,0,0])
        encoder();
    }
    translate([-20,-33,-12])
        rotate([-123,0,0])
        cube([20,3,15], center = true);
    if(inc_encoder){
    encoder();
    }
}

//column();
column_dbl_encoder();
//encoder();