$fn=40;
th = .7;
translate([18,0,0])
scale([.25,.25,1])
rotate([0,180,0])
linear_extrude(height=.5)
import("lr.dxf");

module fast()
{
translate([0,0,1])
rotate([90,0,0])
difference()
{
union()
{
cylinder(r=1, h=2);
translate([-1,-1,0])
cube([2,1,2]);
}
union()
{
translate([0,0,-.1])
cylinder(r=.7, h=3);

translate([-th/2,th/2,0])
cube([th,2,4]);

}
}

}
//R middle
translate([4.5,4.9,0])
scale([1,.65,1])
fast();

//R top
translate([4.5,9,0])
scale([1,.6,1])
fast();


/*
//L bottom
translate([15.8,1.9,0])
scale([1,2,1])
fast();

*/

//L top
translate([15.8,6,0])
scale([1,2,1])
fast();