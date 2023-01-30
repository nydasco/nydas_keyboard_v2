use <obiscad/bevel.scad>
use <obiscad/attach.scad>
use <obiscad/bcube.scad>


switch_holder_size=[22, 22, 5];
switch_holder_block_size=[22,3,5];
switch_holder_block_size_dbl=[42,3,5];

arm_size=[22,5,40];


// Beveling
//-- Top-right beveling
ec1 = [ [switch_holder_size[0]/2, 0, switch_holder_size[2]/2], [0,1,0], 0];
en1 = [ ec1[0],                    [1,0,1], 0];
//-- Top-left beveling
ec2 = [ [-switch_holder_size[0]/2, 0, switch_holder_size[2]/2], [0,1,0], 0];
en2 = [ ec2[0],                    [-1,0,1], 0];

//-- Top-right beveling
bc1 = [ [switch_holder_block_size[0]/2, 0, switch_holder_block_size[2]/2], [0,1,0], 0];
bn1 = [ bc1[0],                    [1,0,1], 0];
//-- Top-left beveling
bc2 = [ [-switch_holder_block_size[0]/2, 0, switch_holder_block_size[2]/2], [0,1,0], 0];
bn2 = [ bc2[0],                    [-1,0,1], 0];

//-- Top-front beveling
ec3 = [ [0, -switch_holder_size[1]/2, switch_holder_size[2]/2], [1,0,0], 0];
en3 = [ ec3[0],                    [0,-1,1], 0];

//-- Top-back beveling
ec4 = [ [0, switch_holder_size[1]/2, switch_holder_size[2]/2], [1,0,0], 0];
en4 = [ ec4[0],                    [0,1,1], 0];

// Beveling for double width
//-- Top-right beveling
bc1d = [ [switch_holder_block_size_dbl[0]/2, 0, switch_holder_block_size_dbl[2]/2], [0,1,0], 0];
bn1d = [ bc1d[0],                    [1,0,1], 0];
//-- Top-left beveling
bc2d = [ [-switch_holder_block_size_dbl[0]/2, 0, switch_holder_block_size_dbl[2]/2], [0,1,0], 0];
bn2d = [ bc2d[0],                    [-1,0,1], 0];

// Arm beveling

//-- Top-right beveling
bc1a = [ [arm_size[0]/2, 0, arm_size[2]/2], [0,1,0], 0];
bn1a = [ bc1a[0],                    [1,0,1], 0];
//-- Top-left beveling
bc2a = [ [-arm_size[0]/2, 0, arm_size[2]/2], [0,1,0], 0];
bn2a = [ bc2a[0],                    [-1,0,1], 0];

//-- Top-front beveling
ec3a = [ [0, -arm_size[1]/2, arm_size[2]/2], [1,0,0], 0];
en3a = [ ec3a[0],                    [0,-1,1], 0];

//-- Top-back beveling
ec4a = [ [0, arm_size[1]/2, arm_size[2]/2], [1,0,0], 0];
en4a = [ ec4a[0],                    [0,1,1], 0];



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
 
 
     
module switch_holder() {
union(){
    difference(){
        difference(){
            difference(){
                difference(){
                    cube(switch_holder_size, center = true);
                    bevel(ec1, en1, cr = 2, cres=10, l=switch_holder_size[1]+2);
                };
                bevel(ec2, en2, cr = 2, cres=10, l=switch_holder_size[1]+2);
            }
            cube([13.2, 13.2, 5], center = true);
        };
        translate([0,0,-1])
        cube([18.8, 17.8, 3], center = true);
    }
        translate([7.316373,7.080354,-2])
        cylinder(4, 1, $fs = 0.01);
    }
}
  
module switch_complete() {
    switch_holder();
    //translate([0, 0, 7])
    //    keycap();
}



 
module column() {
union(){
    switch_complete();
    translate([0,-11,0])
        rotate([-10,0,0])
        difference(){
            cube(switch_holder_block_size, center = true);  
            bevel(bc1, bn1, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
            bevel(bc2, bn2, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
        }
    translate([0,11,0])
        rotate([10,0,0])
        difference(){
            cube(switch_holder_block_size, center = true);  
            bevel(bc1, bn1, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
            bevel(bc2, bn2, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
        }

    translate([0, -22, 4])
        rotate([-20, 0, 0])
        switch_complete();
    translate([0, -40, -8.07])
        rotate([-20, 0, 0])
        difference() {
            cube([22,5,40], center = true);
            bevel(bc1a, bn1a, cr = 2, cres=10, l=arm_size[1]+2);
            bevel(bc2a, bn2a, cr = 2, cres=10, l=arm_size[1]+2);
            bevel(ec3a, en3a, cr = 2, cres=10, l=arm_size[2]+2);
        }

    translate([0, 22, 4])
        rotate([20, 0, 0])
        switch_complete();
    translate([0, 40, -8.07])
        rotate([20, 0, 0])
        cube([22,5,40], center = true);
    }
}



     
module switch_complete_dbl() {
    switch_holder_dbl();
    //translate([0, 0, 7])
    //    keycap();
    //translate([-20, 0, 7])
    //    keycap();
}

module switch_holder_dbl() {
union(){
    difference(){
        difference(){
            difference(){
                difference(){
                    cube(switch_holder_size, center = true);
                    //bevel(ec1, en1, cr = 2, cres=10, l=switch_holder_size[1]+2);
                };
                //bevel(ec2, en2, cr = 2, cres=10, l=switch_holder_size[1]+2);
            }
            cube([13.2, 13.2, 5], center = true);
        };
        translate([0,0,-1])
        cube([18.8, 17.8, 3], center = true);
    }
        translate([7.316373,7.080354,-2])
        cylinder(4, 1, $fs = 0.01);
    }
    
translate([-20,0,0])
union(){
    difference(){
        difference(){
            cube(switch_holder_size, center = true);
            cube([13.2, 13.2, 5], center = true);
        };
        translate([0,0,-1])
        cube([18.8, 17.8, 3], center = true);
    }
        translate([7.316373,7.080354,-2])
        cylinder(4, 1, $fs = 0.01);
    }
}



module column_dbl() {
union(){
    switch_complete_dbl();
    translate([0,-11,0])
        rotate([-10,0,0])
        difference(){
            difference(){
                translate([-10,0,0])
                cube(switch_holder_block_size_dbl, center = true);  
                //bevel(bc1, bn1, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
            };
            //bevel(bc2, bn2, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
        }
    translate([0,11,0])
        rotate([10,0,0])
        difference(){
            difference(){
                translate([-10,0,0])
                cube(switch_holder_block_size_dbl, center = true);  
                //bevel(bc1, bn1, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
            };
            //bevel(bc2, bn2, cr = 2, cres=10, l=switch_holder_block_size[1]+2);
        }

    translate([0, -22, 4])
        rotate([-20, 0, 0])
        switch_complete_dbl();
    translate([0, -37, 1.5])
        rotate([-20, 0, 0])
        cube([22,5,20], center = true);
    translate([-20, -37, 1.5])
        rotate([-20, 0, 0])
        cube([22,5,20], center = true);

    translate([0, 22, 4])
        rotate([20, 0, 0])
        switch_complete_dbl();
    translate([0, 37, 1.5])
        rotate([20, 0, 0])
        cube([22,5,20], center = true);
    translate([-20, 37, 1.5])
        rotate([20, 0, 0])
        cube([22,5,20], center = true);
    }
}


column();