include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

module tree() {
    include <assets/pyt_tree_instructions.scad>
}

import ("assets/Hexagon_coaster_-_no_pattern.stl");

fwd(33) right(8) zrot(30) scale([0.8, 0.8, 1]) tree();

