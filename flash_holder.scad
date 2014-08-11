$fn = 20;

include <polyScrewThread_r1.scad>

use <hotshoe.scad>

//inner width
iw = 18;


//inner thickness
ith = 2;

//inner height
ih = 18;

//outer thickness
oth = 3;

//lip
lip = 2;

//lip thickness
lth = 2;

//bottom thickness
bth = 5;

//side holes distance
shd = 5;

//hole distance
hd = shd;

//fastener length
fl = 10;

//fastener hole radius
fhr = 5;

//fastener gap
fg = 12;

//give
g = .5;

give = 1.5;

fth = ((iw+oth*2+g)-fg)/2;


screw = false;



module holder()
{
module holes()
{
//translate([0,oth+ith/2+g/2,ih/2-shd])
translate([0,oth+ith+lth/2-.3,ih/2-shd])
{
rotate([0,90,0])
{
cylinder(r=lip/2, h=lip*2+oth+20);
translate([-shd-ith,0,0])
cylinder(r=lip/2, h=lip*2+oth+20);

}
}
}

difference()
{
union()
{
cube([iw+g,oth,ih]);

//sides
translate([iw+g,0,0])
  cube([oth,ith+oth+g,ih]);

translate([-oth,0,0])
  cube([oth,ith+oth+g,ih]);
  

//lips
translate([-oth,oth+ith+g,0])
  cube([lip+oth,lth,ih]);

translate([iw+g-lip, oth+ith+g,0])
  cube([lip+oth,lth,ih]);



//bottom thingy

translate([-oth,-bth,0])
cube([iw+oth*2+g,bth,ih]);

}

//holes

translate([-oth*1.5,0,0])
holes();
translate([iw,0,0])
holes();



//bottom holes
translate([iw/2,-bth-1,ih/2-hd/2])
rotate([-90,0,0])
cylinder(r=ith/1.5,h=bth*2);

translate([iw/2,-bth-1,ih/2+hd/2])
rotate([-90,0,0])
cylinder(r=ith/1.5,h=bth*2);


//screw hole thingy
if(screw)
{
translate([iw/2,-2,ih/2])
rotate([90,0,0])
screw_thread(10+give,3,55,bth-1,1.5,2);
}

}


//fasteners
module fastener()
{

echo(fth);

difference()
{
hull()
{
translate([-oth,-bth-fth,0])
cube([fth,fth,ih]);

translate([-oth,-bth-fl,ih/2])
rotate([0,90,0])
cylinder(r=ih/2, h=fth);
}



translate([-oth-1,-bth-fl,ih/2])
rotate([0,90,0])
cylinder(r=fhr, h=fth+2);

}

}

fastener();
//translate([iw+oth-fth/2+g,0,0])

translate([fg+fth,0,0])
fastener();


}

//holder();


translate([-25,0,0])
hex_screw(9.5,3,55,26+10,1.5,2,15,5,2,0);

translate([-45,0,0])
hex_nut(13,8,3,55,9.5+.5,1.5);


/*
translate([iw/2,-10,ih/2])
rotate([90,0,0])
screw_thread(10+give,3,55,bth-2,1.5,2);
*/

module male()
{


difference()
{
union()
{
flashspacer();
translate([-6,-8.6,2])
cube([12,17.5,15]);
translate([-6,.2,15])
rotate([0,90,0])
cylinder(r=17.5/2,h=12);

}
translate([-7,0,15])
rotate([0,90,0])
cylinder(r=fhr,h=12*2);


//side holes for wire
translate([0,-1.5,-1]) rotate([45,0,0]) cylinder(r=1.2,h=12);

translate([0,3.4,-1]) rotate([45,0,0]) cylinder(r=1.2,h=24);

}

}
//color([1,1,1,.5])
male();
translate([20,0,0])
holder();