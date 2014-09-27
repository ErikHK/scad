$fn= 40;
//diameter of hook
d = 10;

//thickness
th = 3;

//width
w = 15;

//tab length
tl = 20;

//hole diameter
hd = 3;


difference()
{
cylinder(r=d/2+th, h=w);
cylinder(r=d/2, h=w);
translate([-d/2-th,0,0])
cube([d+th*2,d+th,w]);
}

difference()
{
translate([d/2,-th,0])
cube([tl+th, th, w]);

translate([d/2+th+tl/2,.1,w/2])
rotate([90,0,0])
cylinder(r=hd/2, h=th*2);
}