use <../mek/shaft.scad>
use <../mek/plate_ny.scad>
include <../mek/inc/constants.scad>


//boat length
bl = 140;

//boat width
bw = 75;

//boat depth
bd = 35;

//boat hull thickness
bhth = 2;

//(front pointiness
//fp = 20;)


//hole height
//measured from flat part
hh = 13;

//boat front ratio
bfr = .6;

//boat depth ratio
bdr = .4;

//scales
scx = (bw-bhth*2)/bw;
scz = (bd-bhth*2)/bd;
scy = (bl-bhth*2)/bl;


//bearing outer radius
bor = 13/2;

//bearing bore radius
bbr = 4/2;

//bearing thickness
bth = 5;

//bearing give
bg = .4;

$fn=20;

module propeller_holder()
{
difference()
{
union()
{
//propeller holder
cylinder(r=8, h=1);
translate([0,0,1])
cylinder(r1=8, r2=7, h=1);

translate([0,0,2])
cylinder(r=7, h=3);


translate([0,0,5])
cylinder(r1=7, r2=8, h=1);
translate([0,0,6])
cylinder(r=8, h=1);

}

//bearing hole
cylinder(r=bor+bg/2, h=5);
}

translate([0,0,7])
cylinder(r1=8,r2=1,h=5);


translate([0,0,12])
cylinder(r=1,h=5);

}

module motor_pulley()
{
difference()
{
union()
{
cylinder(r=4, h=1);
translate([0,0,1])
cylinder(r1=4, r2=3, h=1);

translate([0,0,2])
cylinder(r=3, h=2);


translate([0,0,4])
cylinder(r1=3, r2=4, h=1);
translate([0,0,5])
cylinder(r=4, h=1);
}

cylinder(r=1,h=8);
}

}

module motor_holder()
{

//horizontal bars
translate([0,-hr*4,0])
rotate([0,0,90])
bar(length=2, one_hole=false, holes=[true,true,true]);

translate([hr*4,-hr*4,0])
rotate([0,0,90])
bar(length=2, one_hole=false, holes=[true,true,true]);

//strengtheners
translate([hr,-hr*4-hr/2,0])
cube([hr*2,hr,4]);

translate([hr,hr*4-hr/2,0])
cube([hr*2,hr,4]);





bar(length=2, one_hole=false, holes=[true,true,false]);

translate([hr*4*2,0,4])
cylinder(r=2+.5,h=1);


translate([hr*4*2,0,5])
cylinder(r=2,h=5);

}


module boat()
{
  module hull()
  {
  
  //cuby part
  cube([bw, bl*bfr, bd*(1-bdr)]);

  //under triangle
  rotate([-90,0,0])
  linear_extrude(height=bl*bfr)
  polygon(points=[[0,0],[bw,0],[bw/2, bd*bdr]]);

  //front part
  translate([0,bl*bfr-0,bd*(1-bdr)])
  polyhedron(points=[[0,0,0],[bw,0,0],[bw,0,-bd*(1-bdr)],[bw/2, 0,-bd],[0,0,-bd*(1-bdr)],[bw/2, bl*(1-bfr),0]], faces=[[0,5,1],[1,5,2],[2,5,3], [3,5,4], [4,5,0], [0,1,2,3,4]]);
  }


  difference()
  {
  
  difference()
  {
  hull();
  translate([bhth,bhth,bhth*2])
  scale([scx,scy,scz])
  hull();
  }


  //holes in the back
  translate([(bw-hr*8)/2,bhth*1.5,hh])
  rotate([90,0,0])
  cylinder(r=hr, h=bhth*2);

  
  translate([hr*4+(bw-hr*8)/2,bhth*1.5,hh])
  rotate([90,0,0])
  cylinder(r=hr, h=bhth*2);
  

  translate([hr*8+(bw-hr*8)/2,bhth*1.5,hh])
  rotate([90,0,0])
  cylinder(r=hr, h=bhth*2);

  }
  
  
  //hull();

  /*
  //remove thingies
  //cuby part
  translate([bhth,0,0])
  cube([bw-bhth*2, bl*bfr, bd*(1-bdr)]);

  rotate([-90,0,0])
  linear_extrude(height=bl*bfr)
  polygon(points=[[bhth,0],[bw-bhth,0],[bw/2,bd*bdr-bhth]]);
  */


//polyhedron(points=[[0,0,0],[1,1,0],[2,2,2]], faces=[[0,1,2], [1,2,2]]);


}

boat();

//test thingy
//cube([2,120,2]);



//translate([38,0,10])  rotate([90,90,0])  motor_holder();


//translate([40,30,0])
//motor_pulley();
//translate([-20,0,0])
//propeller_holder();




