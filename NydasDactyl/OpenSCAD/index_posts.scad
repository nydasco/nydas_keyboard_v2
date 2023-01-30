module index_posts() {
    //index-top
    translate([-17,24,0])
        rotate([0,0,95])
        cube([5, 42, 11.49]);

    translate([-18.5,25,0])
        rotate([11,-10,94])
        cube([5, 42, 20]);
    //index-bottom
    union(){
        translate([-10,-50,0])
            rotate([0,0,94])
            cube([5, 42, 20]);
        }
    }