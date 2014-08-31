//outer hole radius
ohr = 53/2;

//outer hole height
ohh = 10;

//inner hole radius
ihr = ohr+5;
echo(ihr);

//inner hole height
ihh = 5;

//wall thickness
wth = 3;

//start with inner hole
difference()
{

//base
union()
{
//cylinder(r=ohr+15, h=2);
translate([0,0,2])
cube([ihr*2+wth*2+20,20,4], center=true);

translate([0,0,2])
rotate([0,0,90])
cube([ihr*2+wth*2+20,20,4], center=true);

cylinder(r=ihr+wth, h=ihh);

}

cylinder(r=ihr, h=ihh);
}


difference()
{
translate([0,0,ihh])
cylinder(r=ihr+wth, h=ihr-ohr);

translate([0,0,ihh])
cylinder(r1=ihr, r2=ohr, h=ihr-ohr);
}


difference()
{
translate([0,0,ihh+ihr-ohr])
cylinder(r=ihr+wth, h=2);

translate([0,0,ihh+ihr-ohr])
cylinder(r=ohr, h=2);
}
