$fn=30;
//thickness
th = 20+2;




module skylt(holes=true)
{
difference()
{
union()
{
translate([0,-11,0])
cube([165,22,th]);

translate([165,0,0])
cylinder(r=54/2, h=th);


translate([0,0,0])
cylinder(r=11, h=th);




difference()
{
translate([165-43,0,0])
cube([30,20,th]);

translate([165-43,40+11,-1])
cylinder(r=40,h=th+2);
}

mirror([0,1,0])
difference()
{
translate([165-43,0,0])
cube([30,20,th]);


translate([165-43,40+11,-1])
cylinder(r=40,h=th+2);
}

}

translate([165+14*.707-2,-6+2,0])
rotate([0,0,45])
cube([25,16,th+2]);

if(holes)
{
cylinder(r=4, h=th+2);

translate([165-11,15,0])
cylinder(r=4, h=th+2);
}

}
}

rotate([0,0,45])
difference()
{
minkowski()
{
skylt(holes=true);
cylinder(r=2,h=.1,$fn=6);
}

translate([0,0,2])
skylt();
}
