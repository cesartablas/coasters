include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

module coaster() {
    import("assets/Hexagon_coaster_-_no_pattern.stl");
}

shape = [[0,5,3],[1,4,4],[2,1,5],[3,0,6],[4,1,6],[5,2,5],[6,7,2]];

side = 10;
r = side/2/sin(60)*sin(90);
dx = side;
dy = sqrt(side*side - side*side/4);

module flag() {
    for (i=[0:len(shape)]) {
        s = shape[i];
        for (j=[1:s[2]]) {
            translate([s[1]*dx/2+j*dx,-s[0]*dy,0]) rotate([0,0,30]) cyl(h=5, r=r, fillet=.5, center=false, $fn=3);
            
            translate([(s[1]*dx/2+j*dx),r-s[0]*dy,0]) cyl(h=5, r=.1, center=false);
            translate([(s[1]*dx/2+(j-0.5)*dx),r-(s[0]+1)*dy,0]) cyl(h=5, r=.1, center=false);
            translate([(s[1]*dx/2+(j+0.5)*dx),r-(s[0]+1)*dy,0]) cyl(h=5, r=.1, center=false);

        }
        }
}

translate([-50+dx/4,35-dy/2,0]) scale([1.20,1.2,1]) flag();
coaster();
