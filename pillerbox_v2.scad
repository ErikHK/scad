//widths for the pill compartments
wp = 8;
//depth for the pill compartments
dp = 12;

//wall size
ws = 1.5;
//pill box height
he = 7;
//wall height (center ones)
wh = he-1;

//tolerance
tol = .1;


difference()
{

cube([wp*7+ws*8, dp+ws*2, he]);

union()
{
translate([ws,ws,0])
for (n = [0:6])
{
translate([n*wp+n*ws,0,ws+.1])
cube([wp,dp,10]);
}
translate([ws,ws,wh])
cube([wp*7+ws*6,dp,he-wh+.1]);

}
}


//lid thingy
module lidthingy()
{
difference()
{
union()
{
translate([0,0,he])
cube([wp*7+ws*8,ws,1]);


translate([0,ws,he+1.01])
rotate([45,0,0])
cube([wp*7+ws*8,ws,ws]);

translate([0,ws,wh+.01])
rotate([45,0,0])
cube([wp*7+ws*8,1,he-wh]);
}

//cut off the roof
translate([-.05,0,he+1+ws*.7])
cube([wp*7+ws*8+.1,ws*2+.1,3]);

}


translate([wp*7+ws*8,0,he+1.01])
rotate([0,-90,0])

linear_extrude(height=wp*7+ws*8+.01)
polygon(points=[[0,0],[0,1.501],[sqrt(2)*(ws/2)+.01,.44]]);

}


lidthingy();

mirror([0,1,0])
translate([0,-dp-ws*2,0])
lidthingy();


translate([0,20,0])
{

cube([wp*7+ws*8+.7,dp-tol*2,1]);
translate([-1,0,0])
cube([1,dp-tol*2,2]);

translate([wp*7+ws*8,0,.7])
rotate([0,45,0])
cube([1,dp-tol*2,1.5]);

}