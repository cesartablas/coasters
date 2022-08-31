
module coaster() import ("assets/Hexagon_coaster_-_no_pattern.stl");

module star() import ("assets/star.stl");
module decor() {
    scale([5,5,10]) star();
    for (a=[0:60:360]) {
        xa = 30 * cos(a);
        ya = 30 * sin(a);
        translate([xa,ya,0]) scale([5/3,5/3,10]) star();
        for (b=[0:60:360]) {
            xb = xa + 10 * cos(b);
            yb = ya + 10 * sin(b);
            translate([xb,yb,0]) scale([5/9,5/9,10]) star();
        }
        translate([34.6410161513775*cos(a+30),34.6410161513775*sin(a+30),0]) scale([5/9,5/9,10]) star();
    }
}
coaster();
rotate([0,0,30]) scale([1.1,1.1,1]) decor();