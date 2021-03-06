include <roundCornersCube.scad>
$fn = 180;

//everything in mm!
//r1 = .3*1000;
//r2 = .1875*1000;

//r2 = .1*1000;
//r1 = .08*1000;


//r2 = .05*1000;
//r1 = .0444444444*1000;


r2 = 30*1000;
r1 = .3*1000;



d = 10;

//diameter of lens
dol = 35;

//lens width
lw = 50;
//lens height
lh = 35;
translate([-(r1),0,0])
intersection()
{
difference()
{
translate([r1-r2+d,0,0])
sphere(r=r2);
color([.5,0,.5,.5])
sphere(r=r1);
}
rotate([0,90,0])
//cylinder(d=dol,h=r1+r2);
translate([-lh/2, -lw/2,0])
rCube(lh,lw,r1+r2,3);
}