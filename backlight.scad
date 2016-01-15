include <roundCornersCube.scad>

$fn = 20;

//band thickness
bth = 1.5;

//band width
bw = 26;

//////////battery compartment////////

//battery compartment width
bcw = 38;

//battery compartment height
bch = 55;

//battery compartment height sans connectors
bch = 52;

//battery compartment thickness
bcth = 13;


//////////housing//////////

//housing inner width
hiw = 40;

//housing inner height
hih = 57;

//housing inner thickness
hith = 20;

//wall thickness
wth = 2;

//radius
rr = 3;

//housing outer width
how = hiw+wth*2;

//housing outer height
hoh = hih+wth*2;

//housing outer thickness
hoth = hith + wth;


/////housing fastener hole/////


//housing fastener hole width
hfhw = 4;

//housing fastener hole length
hfhl = 10;

//housing fastener hole distance from top
hfhd = 3;






//////////clip//////////

//clip thickness
cth = 2.5;

//clip width
cw = bw + 4;

//clip length

cl = hoh;

//clip inner radius (quarter circle)
cir = 3;

//clip angle
ca = asin(cir/cw*.9);

//clip hole length
chl = 6;

//clip hole width
chw = 15;

//////////clip supports//////////

//clip hole support width
chsw = 15;

//clip hole support length
chsl = 4;

//clip hole support thickness
chsth = cth/2;







module housing()
{
  difference()
  {
  cube([hiw+wth*2, hih+wth*2, hith]);
  translate([wth,wth,wth])
  rCube(hiw, hih, hith, rr);

  //fastener hole
  translate([cth*1.5,hoh/2-hfhl/2,hoth-hfhw*1.5-hfhd])
  rotate([0,-90,0])
  rCube(hfhw,hfhl,cth*2,2);
  }



}


module clip()
{

  module clip_support()
  {
    rotate([-90,0,0])
    hull()
    {
    cylinder(d1=chsl, d2=chsl/4, h=chsth);

    translate([chsw-chsl*2,0,0])
    cylinder(d1=chsl, d2=chsl/4, h=chsth);
    }
  }

  intersection()
  {
  difference()
  {
  cylinder(r=cir+cth, h=cl);

  cylinder(r=cir, h=cl);
  }
  
  translate([-cir-cth,0,0])
  cube([cir+cth, cir+cth, cl+1]);
  }


  difference()
  {
  //clip in itself
  translate([-.2,cir,0])
  rotate([0,0,-ca])
  cube([cw, cth, cl]);

  //clip holes
  translate([cw/2-chw/2,10,cl/3-chl/2])
  rotate([90,0,0])
  rCube(chw, chl, cth*20, 2);

  translate([cw/2-chw/2,10,2*cl/3-chl/2])
  rotate([90,0,0])
  rCube(chw, chl, cth*20, 2);
  }


  translate([cw/2-chsl, 0, cl/3])
  clip_support();

  translate([cw/2-chsl, 0, 2*cl/3])
  clip_support();

}

translate([0,0,0])
housing();
translate([cir+cth,0,0])
rotate([-90,0,0])
clip();