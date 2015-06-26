$fn=40;

include <roundCornersCube.scad>

w = 98;
h = 111;
//screw holes
//screw inset diameter
sid = 6.5;

//screw inset height
sih = 2;

//screw hole diameter
shd = 2.75;

distx = 86;
disty = 97;

//give
g = .3;

union()
{
translate([-60,-60,0])
import("copy_of_stunning_blorr-duup (1).stl");
translate([-10-3,-4,105-10])
hole();

translate([-10-3,-4-98+1+4-4,105-10])
hole();


translate([-98+10+3,-4-98+1+4-10,105-10])
rotate([0,0,180])
hole();

translate([-98+10+3,-4+1+4-10-1,105-10])
rotate([0,0,180])
hole();
}


module hole()
{
translate([0,4,-1])
difference()
{
translate([0,-4,0])
rotate([90,0,0])

linear_extrude(height=6)
polygon(points=[[0,10],[10,0],[10,10]], faces=[1,2,3]);

translate([5+1+1,-5-1-1,0])
cylinder(d=shd,h=11);

translate([-5-1,-5-5-1,.5])
cube([10,20,10]);
}
}
/*
translate([-10-3,-4,105-10])
hole();

translate([-10-3,-4-98+1+4-4,105-10])
hole();


translate([-98+10+3,-4-98+1+4-10,105-10])
rotate([0,0,180])
hole();

translate([-98+10+3,-4+1+4-10-1,105-10])
rotate([0,0,180])
hole();
*/

module lid()
{



difference()
{
union()
{
rCube(w, h, 3,2);
color("red")
translate([3+g,4+g,3])
rCube(w-6-2*g,h-8-2*g,1,1.5);
}

translate([(w-distx)/2,(h-disty)/2,-1])
//cylinder(d=shd, h=20);
lid_hole();


translate([(w-distx)/2,(h-disty)/2+disty,-1])
//cylinder(d=shd, h=20);
lid_hole();

translate([(w-distx)/2+distx,(h-disty)/2+disty,-1])
//cylinder(d=shd, h=20);
lid_hole();

translate([(w-distx)/2+distx,(h-disty)/2,-1])
//cylinder(d=shd, h=20);
lid_hole();

}

module lid_hole()
{
translate([0,0,2.25])
cylinder(d=shd, h=20);
translate([0,0,-.01])
cylinder(d=sid, h=2);
}

}

//cutoff();

//translate([-w,-h,106])
//translate([-98,3,0])
//lid();


/*
translate([-6,-100-4,105])
cube([10,97,10]);

translate([-6-86,-7,105])
cube([86,10,10]);
*/
/*
translate([-20,-20,76])
color("red")
cube([20,20,28]);
*/