
//inner width
iw = 20+8;

//inner length
il = 105;

//inner height
ih = 20;

//wall thickness
wth = 2;

//bottom thickness
bth = 1.5;

//mount hole radius
mhr = 1.5;

//mount hole wall thickness
mhwth = 2;

//usb hole width
uhw = 16;

//usb hole height
uhh = 10;

//cable hole radius
chr = 3.5;


module bottom_case()
{


difference()
{
minkowski()
{
cube([iw+wth*2,il+wth*2,ih+bth]);
sphere(r=1, $fn=6);
}

translate([wth, wth, bth])
cube([iw,il,ih+2]);


//USB hole
//translate([wth+iw/2-uhw/2,-1,bth+ih-uhh/2])

translate([wth+iw/2-uhw/2,-1,bth+5])
cube([uhw, wth*2, uhh]);

//cable hole
translate([wth+iw/2, wth*2+il+1,bth+ih])
rotate([90,0,0])
cylinder(r=chr,h=wth*2);


}

//screw holes
translate([wth*2,wth*2,bth])
screw_hole();

translate([iw,wth*2,bth])
screw_hole();

translate([iw,il,bth])
screw_hole();

translate([wth*2,il,bth])
screw_hole();



}


module screw_hole(height=20.8)
{
$fn=20;
difference()
{
cylinder(r=mhr+mhwth,h=height);
cylinder(r=mhr,h=height+1);
}

}

module lid()
{
difference()
{
minkowski()
{
cube([iw+wth*2,il+wth*2,3]);

sphere(r=1, $fn=6);
}


//screw holes
translate([wth*2,wth*2,-bth])
cylinder(r=mhr, h=20, $fn=40);

translate([iw,wth*2,-bth])
cylinder(r=mhr, h=20, $fn=40);

translate([iw,il,-bth])
cylinder(r=mhr, h=20, $fn=40);

translate([wth*2,il,-bth])
cylinder(r=mhr, h=20, $fn=40);

}
}


//translate([0,0,15])
//screw_hole();

bottom_case();


translate([40,0,0])
lid();