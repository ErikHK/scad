$fn = 60;

//hole diameter
hd = 1.6;



module clamp_base()
{
difference()
{
union()
{
translate([-2.5,-2.5-15,0])
cube([19,20,4]);

translate([-2.5-3,-2.5-15,0])
cube([25,5,4]);
}


//holes for the clamp thing
//19 mm between holes
translate([-2.5,-15,0])
cylinder(r=hd, h=4);
translate([14+2.5,-15,0])
cylinder(r=hd, h=4);



//holes in extruder thingy
cylinder(r=hd, h=4);
translate([14,0,0])
cylinder(r=hd, h=4);
}
}

module clamp()
{
difference()
{
difference()
{
cube([24+4,8,12]);

translate([12+2,9,12])
rotate([90,0,0])
cylinder(r=7.5, h=12);
}

//holes
translate([4.5, 3.5,-1])
cylinder(r=hd, h=25);

translate([4.5+19, 3.5,-1])
cylinder(r=hd, h=25);
}
}


clamp_base();
translate([30,0,0])
clamp();


