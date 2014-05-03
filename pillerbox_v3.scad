//widths for the pill compartments
wp = 10;
//depth for the pill compartments
dp = 15;

//wall size
ws = 1.5;
//side wall size
sws = 3.5;
//ridge width
rw = 1;
//ridge height
rh = 2;
//ridge thing height
rth = 1.5;
//pill box height
he = 7;
//wall height (center ones)
wh = he-1;

//tolerance
tol = 1;


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
translate([0,-sws+ws,0])
cube([ws*8+wp*7,sws-rw,he+rh]);


//ridge thingy
translate([0,-sws+ws,he+rh+rth-.01])
rotate([0,90,0])
//cylinder(r=sws/2, h=10, $fn=6);
linear_extrude(height=wp*7+ws*8)
polygon(points=[[0,0],[rth,0],[rth,sws-rw], [0,sws]]);

}


lidthingy();

mirror([0,1,0])
translate([0,-dp-ws*2,0])
lidthingy();


//lid
translate([0,30,0])
{

cube([wp*7+ws*8+.7,dp+rw*2-tol*2,1.5]);
translate([-1.5,0,0])
cube([1.5,dp+rw*2-tol*2,2.5]);

translate([wp*7+ws*8-.2,0,.7*1.2])
rotate([0,45,0])
cube([1.2,dp+rw*2-tol*2,2.2]);

}


