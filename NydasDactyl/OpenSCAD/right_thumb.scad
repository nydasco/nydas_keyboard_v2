
use <switch_complete.scad>

module track_ball() {
    difference() {
        import(convexity = 2, file = "parts/trackball_socket_body_34mm.stl", origin = [0, 0]);
        union() {
            import(convexity = 2, file = "parts/trackball_socket_cutter_34mm.stl", origin = [0, 0]);
            import(convexity = 2, file = "parts/trackball_sensor_cutter.stl", origin = [0, 0]);
        }
    }
    import(convexity = 2, file = "parts/trackball_sensor_mount.stl", origin = [0, 0]);
}
track_ball_offset = [10,30,6];
track_ball_rotation = [23,0,0];



module right_thumb(){
    translate(track_ball_offset)
        rotate(track_ball_rotation)
        track_ball();

    difference() {
        column(full=false);
        
        translate(track_ball_offset)
        rotate(track_ball_rotation)
            union() {
                
                import(convexity = 2, file = "parts/trackball_socket_cutter_34mm.stl", origin = [0, 0]);
                import(convexity = 2, file = "parts/trackball_socket_body_34mm.stl", origin = [0, 0]);
                

                cylinder(5,21,21);
            }
    }
    
    
        translate([10,47.9,-35.5])
        rotate(track_ball_rotation)
        difference(){
        cylinder(50,25,25);
            
        cylinder(55,17,20);
        }
    
    translate(track_ball_offset)
        sphere(d = 34);
    
}

right_thumb();
