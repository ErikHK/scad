//widths for the pill compartments
wp = 10;
//depth for the pill compartments
dp = 15;
//floor thickness
ft = 1;

//wall size
ws = 2;
//side wall size
sws = 6;
//ridge width
rw = 2;
//ridge height
rh = 1.7;
//ridge thing height
rth = 1.8;
//pill box height
he = 8;
//wall height (center ones)
wh = he-1;

//lid handle
lh = 5;

//tolerance
tol = .5;



difference()
{

cube([wp*7+ws*8, dp+ws*2, he]);

union()
{
translate([ws,ws,0])
for (n = [0:6])
{
translate([n*wp+n*ws,0,ft+.1])
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



/*
//lid
translate([0,30,0])
{

cube([wp*7+ws*8+.7,dp+rw*2-tol*2,2]);
translate([-lh,0,0])
cube([lh,dp+rw*2-tol*2,4.5]);


difference()
{
translate([wp*7+ws*8-.7,0,.7*2])
rotate([0,42,0])
cube([2,dp+rw*2-tol*2,3]);


translate([wp*7+ws*8,-1,2.9])
cube([10,dp+rw*2-tol*2+2,2]);
}

}
*/


//alt lid
translate([0,30,0])
{

cube([wp*7+ws*8+.7,dp+rw*2-tol*2,2]);


difference()
{
translate([wp*7+ws*8-.7,0,.7*2])
rotate([0,42,0])
cube([2,dp+rw*2-tol*2,3]);


translate([wp*7+ws*8,-1,2.6])
cube([10,dp+rw*2-tol*2+2,2]);
}




difference()
{
translate([wp*7+ws*8-.7,0,.7*2])
rotate([0,42,0])
cube([2,dp+rw*2-tol*2,3]);


translate([wp*7+ws*8,-1,2.6])
cube([10,dp+rw*2-tol*2+2,2]);
}




difference()
{
translate([0,0,0])
rotate([0,-42,0])
cube([2,dp+rw*2-tol*2,3]);


translate([-3,-1,2.6])
cube([10,dp+rw*2-tol*2+2,2]);
}

}
