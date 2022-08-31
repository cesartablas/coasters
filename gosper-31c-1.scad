include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <dotSCAD/line2d.scad>

include <assets/gosper-31c-1-instructions.scad>

module coaster() {
    import("assets/Hexagon_coaster_-_no_pattern.stl");
}
module cutter() {
    difference() {
        down(3) cylinder(h=7, r=200);
        coaster();
    }
}
module shape() {
    difference() {
        translate([-7,-74,-2]) scale([1,1,1]) linear_extrude(height=5) gosper();
        cutter();
    }
}

coaster();
translate([0,0,2]) shape();