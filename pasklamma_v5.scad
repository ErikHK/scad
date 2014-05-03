$fn = 40;
include <roundCornersCube.scad>

//distance between parts
distb = 1.5;

//length of part
le = 40;

//width of part
wi = 20;

//height of top part
he = 4.5;

//ridge height
rihe = 3.5;

//ridge width
riwi = 4;

//padding
p = 1.4;

//give between ridges and holes
g = .5;

//connection height
cohe = .51;

//thingy length
thle = 3.5;

//thingy height
thhe = 2;

//thingy width
thwi = 6;

//fastener give
fagi = 1.0;

//ridge dist from fastener
ridi = 5;


module top()
{

  difference()
  {
    rCube(le,wi,he,2);

    //ridge holes
    union()
    {
      translate([p,2*p-g,he-rihe-g])
      rCube(le-2*p,riwi+2*g,he+1, 1);

      translate([p,wi-2*p-g-riwi,he-rihe-g])
      rCube(le-2*p,riwi+2*g,he+1, 1);


    }
  }

//fastener thingy protr.
translate([-thle, wi/2+thwi/2,0])
//cube([thle,thwi,he]);
rotate([90,0,0])
linear_extrude(height=thwi)
polygon(points=[[0,0],[0,thhe],[thle,he], [thle,0]]);




}

module bottom()
{
difference()
{
translate([distb+le,0,0])
rCube(le+3,wi,he, 2);


    //HK logo
      scale(1)
mirror([1,0,0])
translate([-le*3/2-10,wi/2-5,-.6])
linear_extrude(height=2)
import("hk.dxf");
}

//ridges
translate([distb+le+p+2*g,2*p,he])
rCube(le-2*p-2*g-ridi,riwi,rihe,1);

translate([distb+le+p+2*g,wi-riwi-2*p,he])
rCube(le-2*p-2*g-ridi,riwi,rihe, 1);


//fastener thingy
difference()
{
  translate([2*le+distb,0,0])
  rCube(thle,wi,he*3.3,2);


  union()
  {
  translate([2*le+distb-1,wi/2-thwi/2-fagi,he])
  cube([thle*2,thwi+2*fagi,he+2*fagi]);


//inset thing
/*
translate([2*le+distb,wi+.05,he+thle/3])
rotate([90,0,0])
cylinder(h=wi+.1,r=thle/3, $fn=4);
*/

  }
}


}

module connection()
{
  translate([le,2,he-cohe])
  cube([2,wi-4,cohe]);
}

top();
bottom();
connection();