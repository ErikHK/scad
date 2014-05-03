linear_extrude(height=2)
import("e3k.dxf");
cube([100,3,10]);

translate([100,60,0])
mirror([1,0,0])
linear_extrude(height=2)
import("e3k.dxf");
translate([0,60,0])
cube([100,3,10]);