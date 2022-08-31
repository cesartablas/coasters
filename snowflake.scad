use <BOSL/constants.scad>
include <BOSL/shapes.scad>

module coaster() {
    import("assets/Hexagon_coaster_-_no_pattern.stl");
}
module bite() {
    difference() {
        cuboid(size=[100,4,10]);
        fwd(400-.2) cyl(h=200,d=800, $fn=100);
        back(400-.2) cyl(h=200,d=800, $fn=100);
    }
}
module base() {
    difference() {
        zrot(30) cyl(h=5, d=50, center=false, $fn=6);
        zrot(30) up(4.8) difference() {
            cyl(h=5, d=35, center=false, $fn=6);
            cyl(h=5, d=20, center=false, $fn=6);
        }
        up(9.6) bite();
        zrot(60) up(9.6) bite();
        zrot(-60) up(9.6) bite();
    }
}
module branch() {
    up(2.5) back(27.5) union() {
        stem1();
        for (a=[-60:60:60]) {
            back(15-abs(5*sin(a))) left(9*sin(a)) zrot(a) stem2();
        }
    }
}
module stem1() {
    cuboid(size=[4,15,5]);
}
module stem2() {
    cuboid(size=[2,20,5]);
    stem3();
    scale([-1,1,1]) stem3();
}
module stem3() {
    a=7;
    e=1.2;
    d=4.5;
    zrot(60) back(a/2+1) left(-1) cuboid(size=[e,a,d]);
    b=5.5;
    back(b/2+2.5) left(b/2) zrot(60) cuboid(size=[e,b,d]);
    c=4;
    back(c/2+5.5) left(c/2) zrot(60) cuboid(size=[e,c,d]);
}
module decor() {
    base();
    for (a=[60:60:360]) zrot(a) branch();
}

coaster();
s = .9;
scale([s,s,1]) decor();
