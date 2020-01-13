$fn=40;
include <roundCornersCube.scad>

//main diameter
md = 16;

//bolt head diameter
bhd = 10.5;
//bolt head height
bhh = 6;

//bolt length
bl = 20;

//tot height
th = 10+1.5;

//tot length
tl = 31;

//tot width
tw = 13;

//x offs
xoff = md/2+2;

module holder()
{
    difference()
    {
    rotate([90,0,0])
    difference()
    {
      rCube(tl,th,tw,2);
      translate([md/2+2,th,0])
        cylinder(d=md, h=20);
    }
  
    translate([xoff+md/2+6,-tw/2,0])
  cylinder(d=6.5, h=20);
    
    translate([xoff+md/2+6,-tw/2,-20+bhh])
  cylinder(d=bhd, h=20);
}
}

rotate([-90,0,0])
holder();