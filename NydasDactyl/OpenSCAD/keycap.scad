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
 
 keycap();