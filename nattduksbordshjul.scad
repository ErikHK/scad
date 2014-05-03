$fn = 40;
include <roundCornersCube.scad>

//8 mm hole, 22 mm outer, bearing size

//base width
bw = 50;
//base height
bh = 50;
//base thickness
bth = 2.5;

//clearance for holes from sides
ch = 2;
//clearance for holes for wheel
chw = 9;
//clearance for holders
chh = 8;
//hole radius
hr = 2;
//wheel hole radius
whr = 4.5;

//holder height
hh = 28;

/*
//bearing
difference()
{
translate([0,0,23])
rotate([0,90,0])
cylinder(r=11,h=7);

translate([-1,0,23])
rotate([0,90,0])
cylinder(r=4,h=10);
}
*/

difference()
{
union()
{
rCube(bw, bh, bth, 2);

translate([bw-ch-hr-chh-5,0,0])
wheelholder();
translate([ch+hr+chh-1,0,0])
wheelholder();



}

translate([0,0,0-.01])
union()
{
translate([0,0,-bw])
cube([bw+1,bh+1,bw]);


translate([hr+ch,hr+ch,0])
cylinder(r=hr,h=bth+1);


translate([-hr-ch+bw,hr+ch,0])
cylinder(r=hr,h=bth+1);

translate([-hr-ch+bw,-hr-ch+bh,0])
cylinder(r=hr,h=bth+1);

translate([hr+ch,-hr-ch+bh,0])
cylinder(r=hr,h=bth+1);


}
}


//wheel holder
module wheelholder()
{

difference()
{
translate([0,bh/2,bth])
linear_extrude(height=hh, scale=[1,.3])
translate([0,-bh/2,0])
square([6,bh]);


translate([-1,bh/2,hh-chw+bth])
rotate([0,90,0])
cylinder(r=whr,h=9);
}

/*
difference()
{
rotate([0,90,0]){
minkowski()
{
cylinder(r=bh/2-bh*.04, h=6, $fn=4)
;
translate([-bh/3,0,0])
cylinder(r=2, h=.01);
}
}



translate([-1,0,2*bh/3-chw])
rotate([0,90,0])
cylinder(r=whr,h=8);

}
*/
}




module wheel()
{
difference()
{
cylinder(r=11+4,h=12);


union()
{
translate([0,0,-.01])
cylinder(r=4+.45,h=20);

translate([0,0,-.01])
cylinder(r=11+.3,h=9);


}

}
}


translate([70,70,12])
//rotate([0,90,0])
//rotate([0,180,0])
mirror([0,0,1])
wheel();


include <polyScrewThread_r1.scad>

translate([-25,0,0])
//rotate([0,90,0])
hex_screw(7.9,4,55,15,1.5,2,14,4,25,0);

translate([-25,-25,0])
hex_nut(14,8,4,55,8.5,0.5);
