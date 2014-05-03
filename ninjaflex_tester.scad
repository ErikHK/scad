$fn=40;

include <roundCornersCube.scad>
cube([10,10,3]);


translate([30,10,0])
cylinder(r=10,h=2);

translate([30,30,0])
rCube(6,6,2,1);


translate([-10,0,0])
cylinder(r1=8,r2=0,h=8,$fn=4);