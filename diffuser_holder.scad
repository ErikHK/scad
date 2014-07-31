include <roundCornersCube.scad>

//width
w = 66;

//height
h = 39;

//depth
d = 9;

//notch height
nh = 6;

//give
g = 1;

//radius
r = 1.5;

//wall thickness
wth = 2;



module frame()
{

difference()
{
rCube(w+wth*2+g,h+wth*2+g,d,r);
translate([wth,wth,-.1])
rCube(w+g,h+g,d+1,r);

//slit
translate([wth+r,h,d-nh-1.5])
cube([w+g-r*2,h,1.5]);
}


echo(w+g-r*2);

//holders
module holder(length=6)
{
translate([wth,h/2+length/2+wth,d-1])
rotate([90,0,0])
cylinder(r=1,h=length, $fn=4);
}

holder();
translate([w+g,0,0])
holder();



}


frame();

//cylinder(r=1,h=6);