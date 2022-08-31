include <dotSCAD/line2d.scad>
use <BOSL/constants.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

module coaster() {
    import("assets/Hexagon_coaster_-_no_pattern.stl");
}
module cutter() {
    r=20.4;
    difference() {
        cyl(h=100, d=200);
        translate([30-r*cos(30),-r*sin(30),0]) cyl(h=200,r=r, $fn=64);
    }
}
module third_base() {
    r = 20.4;
    linear_extrude(height=5) line2d(p1=[0,0],p2=[30,0],width=1,p1Style="CAP_ROUND",p2Style="CAP_ROUND");
    n = 20;
    da = 90/n;
    for (i=[1:20]) {
        a = 270 + i*da;
        p1 = [r*cos(a), r+r*sin(a)];
        
        m = i*da;
        p2 = [r*cos(a)+30*cos(m),r+r*sin(a)+30*sin(m)];
        linear_extrude(height=4.8) line2d(p1=p1,p2=p2,width=.4);
    }
}
module third() {
    difference() {
        r=20.4;
        third_base();
        cutter();
    }
}
module unit() {
    third();
    right(30) zrot(120) third();
    right(15) back(30*sin(60)) zrot(240) third();
}
module decor() {
    for (a=[0:60:330]) zrot(a) unit();
}
coaster();
s = 1.6;
scale([s,s,1]) zrot(30) decor();
