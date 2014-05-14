include <polyScrewThread_r1.scad>

//base radius
br = 35;

//base height
bh = 5;

//holder width
hw = 80;

//holder height
hh = 44;

//holder thickness
hth = 3;

//minkowski radius
mr = 3;

//axle width 1
aw1 = 28+mr*2;

//axle width 2
aw2 = 12+mr*2;

give = .2;


module screw()
{
hex_screw(12/sqrt(2),4,55,16,1.5,2,15,0,4,0);
}

module screw_hole()
{
hex_screw(12/sqrt(2)+give,4,55,16,1.5,2,15,0,4,0);
}


module base()
{
screw();

cylinder(r=br, h=bh-2);
translate([0,0,bh-2])
cylinder(r1=br, r2=br-2, h=2);

}

module holder()
{
translate([aw1+(hw-aw1-aw2)/2, -hh/2, 0])
screw();

minkowski()
{
cylinder(r=3,h=.01);
difference()
{
linear_extrude(height=hth)
polygon(points=[[0,0],[hw/3,0],[2*hw/3,-(hh-aw1)/2],[hw,-(hh-aw1)/2], [hw,-(hh-aw1)/2-(aw1-aw2)-aw2], [2*hw/3,-(hh-aw1)/2-(aw1-aw2)-aw2], [aw1,-hh], [0,-hh]]);

translate([0,-(hh-aw1)/2-aw1,0])
{
translate([-aw1/2,0,0])
cube([aw1,aw1,4]);
translate([aw1/2,aw1/2,0])
cylinder(r=aw1/2, h=4);
}

translate([hw,-hh/2-aw2+aw2/2,0])
{
translate([-aw2/2,0,0])
cube([aw2,aw2,5]);
translate([-aw2/2,aw2/2,0])
cylinder(r=aw2/2, h=10);
}
}

//translate([-hw/2, -hh/2,0])

/*
minkowski()
{
cylinder(r=3,h=.01);
difference()
{

cube([hw,hh,hth]);



translate([hw-aw1*1.5,hh/2-aw1/2,0])
cube([aw1*1.5,aw1,hth+1]);
}
}
*/
}
}


module pole()
{




difference()
{
cylinder(r=6, h=75);

screw_hole();

translate([0,0,75])
rotate([180,0,0])
screw_hole();
}

}
translate([50,20,0])
pole();
holder();

translate([-40,0,0])
base();