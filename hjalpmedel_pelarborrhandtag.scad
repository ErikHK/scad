$fn = 100;
use <polyScrewThread_r1.scad>



difference()
{
cylinder(d1=12, d2=8, h=23);
    translate([0,0,-1])
screw_thread(8, 1.25, 45, 22, 1.5, 2, 30, 10, 0, 0);
    
}
