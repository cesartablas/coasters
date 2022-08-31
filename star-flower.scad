include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <dotSCAD/line2d.scad>

module coaster() {
    import("assets/Hexagon_coaster_-_no_pattern.stl");
}
module star(ri, ro, hollow=true) {
    star_points = [    
        for (a=[0:30:390])
            if (a%60) [ro*cos(a),ro*sin(a)]
            else [ri*cos(a),ri*sin(a)]
    ];
    if (hollow) {
        for (i=[1:len(star_points)-1]) {
            linear_extrude(height=5) line2d(p1=star_points[i], p2=star_points[i+1], p1Style="CAP_ROUND", p2Style="CAP_ROUND", $fn=32);
        }
    } else {
        linear_extrude(height=5) polygon(star_points);
    }
}
module leafs() {
    right(8.5-0*1.5+10*sin(60)) cyl(h=5, r=7, $fn=6, center=false);
    a = 15;
    zrot(30) right(a) linear_extrude(height=5) petals();
}
module petals() {
    w = 7;
    l = 7;
    a = sqrt(l*l-w/2*w/2);
    b = sqrt(w*w-w/2*w/2);
    line2d(p1=[0,0], p2=[a,w/2], p1Style="CAP_ROUND", p2Style="CAP_ROUND", $fn=32);
    line2d(p1=[a,w/2], p2=[a+b,0], p1Style="CAP_ROUND", p2Style="CAP_ROUND", $fn=32);
    line2d(p1=[a+b,0], p2=[a,-w/2], p1Style="CAP_ROUND", p2Style="CAP_ROUND", $fn=32);
    line2d(p1=[a,-w/2], p2=[0,0], p1Style="CAP_ROUND", p2Style="CAP_ROUND", $fn=32);
}

module decor() {
    star(10*sin(60),15);
    //s = 1.425;
    s=.85;
    rotate([0,0,30]) scale([s,s,1]) star(5,10*sin(60),false);
    for (a=[0:60:300]) zrot(a) leafs();
}

coaster();
scale([1.75,1.75,1]) decor();