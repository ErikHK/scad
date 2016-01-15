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
bchs = 52;

//battery compartment thickness
bcth = 13;


//////////housing//////////

//housing inner width
hiw = 42;

//housing inner height
hih = 58;

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


/////stoppers/////

//stopper width
sw = 15;

//stopper height
sh = 3.5;

//stopper thickness
sth = 1.5;

//stopper distance from top
sd = .5;




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




module rounder()
  {
  translate([0,0,hoth])
  {
  rotate([-90,0,0])
  rCube(how, hoth, hoh,5);

  translate([0,0,-hoth])
  cube([10,hoh,hoth]);
  }
  }

//translate([0,0,0])
//rounder();

module housing()
{
  module stopper()
  {
    hull()
    {
    sphere(r=sh/2, $fn=7);
    translate([0,sw-sh,0])
    sphere(r=sh/2, $fn=7);
    }
  }
  
  translate([how-wth+sh/2-sth,1*hoh/3 + sh/2 - sw/2,hoth-sh/2-sd])
  stopper();

  translate([how-wth+sh/2-sth,2*hoh/3 -sw/2 + sh/2,hoth-sh/2-sd])
  stopper();


  difference()
  {
  //intersection()
  //{
  cube([hiw+wth*2, hih+wth*2, hoth]);
  //rounder();
  //}
  translate([wth,wth,wth])
  rCube(hiw, hih, hith+1, rr);

  //fastener hole
  translate([cth*1.5,hoh/2-hfhl/2,hoth-hfhw-hfhd])
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

module battery_comp()
{
  cube([bcw,bch,bcth]);
}

//translate([wth+1, wth+1,0])
//battery_comp();

module light()
{

housing();
translate([cir+cth,0,0])
rotate([-90,0,0])
clip();
}

rotate([90,0,0])
light();