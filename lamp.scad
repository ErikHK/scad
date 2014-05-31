include <polyScrewThread_r1.scad>
$fn=60;


//screw radius
sr = 5;

module big_piece()
{

difference()
{
minkowski()
{
difference()
{
cube([70, 110, 4]);

translate([35,110,-.1])
rotate([0,0,10])
scale([1,2,1])
cylinder(r=35,h=5);
}

cylinder(r=1,h=.1, $fn=6);
}
translate([35,20,0])
screw_hole();
}
}



module small_piece()
{
rotate([0,0,180])
{
difference()
{
minkowski()
{
translate([0,20,0])
difference()
{
translate([0,-20,0])
cube([50, 100, 4]);

translate([24.5,76,-.1])
rotate([0,0,-10])
scale([1,2,1])
cylinder(r=26,h=5);
}

cylinder(r=1,h=.1, $fn=6);
}

translate([25,30,0])
screw_hole();
}
}
}


module screw_hole()
{
translate([0,0,-.1])
cylinder(r1=5,r2=7.5,h=4.2);

}


module center_piece()
{


difference()
{
cylinder(r=57/2+4, h=40);

cylinder(r=21, h=41);

translate([0,0,5])
cylinder(r=57/2+1, h=41);



translate([0,0,30])
for(i=[0:4])
{
rotate([0,0,90*i])
rotate([90,0,0])
cylinder(r=sr,h=50);
}


translate([0,0,15])
rotate([0,0,45])
for(i=[0:4])
{
rotate([0,0,90*i])
rotate([90,0,0])
cylinder(r=sr,h=50);
}

}

}





center_piece();




translate([-40+5,60,10])
rotate([90,0,0])
big_piece();


translate([150,0,0])


translate([-40,60,40])
rotate([90,0,0])
small_piece();