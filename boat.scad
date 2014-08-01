use <../mek/shaft.scad>
use <../mek/plate_ny.scad>
include <../mek/inc/constants.scad>

//bearing outer radius
bor = 13/2;

//bearing bore radius
bbr = 4/2;

//bearing thickness
bth = 5;

//bearing give
bg = .4;

$fn=20;

module propeller_holder()
{
difference()
{
union()
{
//propeller holder
cylinder(r=8, h=1);
translate([0,0,1])
cylinder(r1=8, r2=7, h=1);

translate([0,0,2])
cylinder(r=7, h=3);


translate([0,0,5])
cylinder(r1=7, r2=8, h=1);
translate([0,0,6])
cylinder(r=8, h=1);

}

//bearing hole
cylinder(r=bor+bg/2, h=5);
}

translate([0,0,7])
cylinder(r1=8,r2=1,h=5);


translate([0,0,12])
cylinder(r=1,h=5);

}

module motor_pulley()
{
difference()
{
union()
{
cylinder(r=4, h=1);
translate([0,0,1])
cylinder(r1=4, r2=3, h=1);

translate([0,0,2])
cylinder(r=3, h=2);


translate([0,0,4])
cylinder(r1=3, r2=4, h=1);
translate([0,0,5])
cylinder(r=4, h=1);
}

cylinder(r=1,h=8);
}

}

module motor_holder()
{

//horizontal bars
translate([0,-hr*4,0])
rotate([0,0,90])
bar(length=2, one_hole=false, holes=[true,true,true]);

translate([hr*4,-hr*4,0])
rotate([0,0,90])
bar(length=2, one_hole=false, holes=[true,true,true]);

//strengtheners
translate([hr,-hr*4-hr/2,0])
cube([hr*2,hr,4]);

translate([hr,hr*4-hr/2,0])
cube([hr*2,hr,4]);





bar(length=2, one_hole=false, holes=[true,true,false]);

translate([hr*4*2,0,4])
cylinder(r=2+.5,h=1);


translate([hr*4*2,0,5])
cylinder(r=2,h=5);

}
motor_holder();

translate([40,30,0])
motor_pulley();
translate([-20,0,0])
propeller_holder();




