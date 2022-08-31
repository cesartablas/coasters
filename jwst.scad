include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

size = 20;
height = 5;
sep = size*sin(60);
filsz = 1;

module two() {
    yspread(n=2, spacing=sep) {
        cyl(h=height, d=size, fillet=filsz, align=V_ABOVE, $fn=6);
    }
}
module three() {
    yspread(n=3, spacing=sep) {
        cyl(h=height, d=size, fillet=filsz, align=V_ABOVE, $fn=6);
    }
}
module four() {
    yspread(n=4, spacing=sep) {
        cyl(h=height, d=size, fillet=filsz, align=V_ABOVE, $fn=6);
    }
}
module shape() {
    cyl(h=1, d=10, fillet=.3, $fn=6);
    back(1.5*sep) two();
    fwd(1.5*sep) two();
    left(0.75*size) four();
    right(0.75*size) four();
    left(1.5*size) three();
    right(1.5*size) three();
}
import("assets/Hexagon_coaster_-_no_pattern.stl");

shape();