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
bcth = 14;


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
cth = 2;

//clip width
cw = bw + 4;

//clip length

cl = hoh;

//clip inner radius (quarter circle)
cir = 3;

//clip angle
ca = asin(cir/cw*.8);

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


//////////switch hole//////////
//switch hole width
swhw = 8;

//switch hole height
swhh = 4.2;

//switch hole distance from top
shdft = 1.5;

//////////fastener//////////

//fastener give
fg = .2;



//////////lid//////////

//lid sphere thickness
lsth = 2.5;

//lid thickness
lth = 3;

//////////led holder//////////

//led holder outer width
lhow = 41;

//led holder outer height
lhoh = 13;

//led holder thickness
lhth = 18;

//led holder wall thickness
lhwth = 1.5;

//led holder inner width
lhiw = lhow-lhwth*2;

//led holder inner height
lhih = lhoh-lhwth;

//////////led fastener//////////

//led fastener width
lfw = 18.4;

//led fastener inner height
lfih = 1.4;

//led fastener outer height
lfoh = 3.4;

//led fastener snap width
lfsw = 1.3;

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

  //switch hole
  translate([-swhw/2 + how/2,5,hoth-swhh-shdft])
  rotate([90,0,0])
  rCube(swhw, swhh, 10,1.5);
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

//translate([wth+1, wth+1,wth])
//battery_comp();

module light()
{

  intersection()
  {
  
  translate([0,0,-20])
  rCube(hiw+wth*2, hih+wth*2, hoth+20,4);
union()
{
housing();
translate([cir+cth,0,0])
rotate([-90,0,0])
clip();
}
}
}

module lid()
{

//lid sphere
R = lsth/2 + hoh*hoh/(8*lsth);


intersection()
{
translate([how/2,hoh/2,R-lsth])
sphere(r=R, $fn=190);
translate([0,0,-lsth])
rCube(how,hoh,wth+lsth,4);
}


rCube(how,hoh, lth,4);

color("red")
translate([wth,wth,lth-.0001]) //manifold bug fix...
rotate([90,0,90])
linear_extrude(height=1.67)
polygon(points=[[0,0],[hih/2-hfhl/2, hfhd+hfhw],[hih/2+hfhl/2,hfhd+hfhw],[hih,0]], paths=[[0,1,2,3,0]]);

//fastener
hull()
{
translate([hfhw-wth,wth+hih/2+hfhl/2-hfhw/2,lth+hfhd+hfhw/2])
sphere(d=hfhw-fg*2, $fn=8);

translate([hfhw-wth,wth+hih/2-hfhl/2+hfhw/2,lth+hfhd+hfhw/2])
sphere(d=hfhw-fg*2, $fn=8);
}


//stoppers "hinge"
color("green")
translate([how-1.67-wth-sth,wth,lth-.0001]) //manifold bug fix...
rotate([90,0,90])
linear_extrude(height=1.67)
polygon(points=[[0,0],[hih/3-sw/2, sd+sh+1.67],[2*hih/3+sw/2,sd+sh+1.67],[hih,0]], paths=[[0,1,2,3,0]]);


translate([how-1.67-wth-sth+1.67,wth,lth+1.67+sh+sd])
rotate([0,90,0])
rotate([90,0,90])
linear_extrude(height=1.4)
polygon(points=[[hih/3-sw/2,0],[hih/3-sw/2+sth, sth],[2*hih/3+sw/2-sth,sth],[2*hih/3+sw/2,0]], paths=[[0,1,2,3,0]]);


}


module led_holder()
{
  difference()
  {
  cube([lhow, lhoh, lhth]);
  translate([lhwth, lhwth+.01,-.1])
  cube([lhiw, lhih, lhth+2]);
  }

  module fastener()
  {
  translate([0,-lfih-(lfoh-lfih),0])
  cube([lfsw, lfoh, lhth]);
  translate([lfsw,-lfih-(lfoh-lfih)/2,0])
  cylinder(d=lfoh-lfih, h=lhth, $fn=4);
  }
  
  translate([lhow/2-lfw/2-lfsw,0,0])
  fastener();
  translate([lhow/2+lfw/2+lfsw,0,0])
  mirror([1,0,0])
  fastener();

  translate([0,lhoh,0])
  cube([5,lhwth,lhth]);

  translate([lhow-5,lhoh,0])
  cube([5,lhwth,lhth]);

  //translate([lhow/2-lfw/2,0,0])
  //color("blue")
  //cube([18.3, 10, 10]);

}


//led_holder();

//translate([0,hoh,hoth+lth])
//rotate([180,0,0])


//translate([0,0,hoth])
//rotate([90,0,0])
//lid();

rotate([90,0,0])
//color([.5,.5,.5,.1])
light();