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


//slit width
slw = w+g-r*2;

//diffuser width
dw = slw-g;


module frame()
{

difference()
{
rCube(w+wth*2+g,h+wth*2+g,d,r);
translate([wth,wth,-.1])
rCube(w+g,h+g,d+1,r);

//slit
translate([wth+r,h,d-nh-1.5])
cube([slw,h,1.5]);
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

module straight_grid_diffuser(wh=4, hh=4, fillx=.5, filly=.5)
{

width=fillx*dw/(wh+1);
height=filly*h/(hh+1);
//translate([wth+r,0,-2])
//cube([dw,h,1]);

union()
{
for(i=[0:wh])
{
translate([i*(dw-width)/wh,0,0])
cube([width,h,1]);
}

color("red")
for(i=[0:hh])
{
translate([0,i*(h-height)/hh,0])
cube([dw,height,1]);
}
}


}


module grid_diffuser()
{
cube([dw,h,1]);

cylinder(r=2,h=3,$fn=4);


}


//straight_grid_diffuser();
grid_diffuser();



//frame();



