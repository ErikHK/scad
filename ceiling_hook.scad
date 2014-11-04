use <../mek/screws.scad>
use <polyScrewThread_r1.scad>

$fn= 40;
//diameter of hook
d = 10;

//thickness
th = 4;

//width
w = 15;

//tab length
tl = 20;

//hole diameter
hd = 3;


//disk diameter
dd = 100;

//ball diameter
bd = 550;


//cord hider inner width
chiw = 30;

//cord hider inner height
chih = 20;

//cord hider length
chl = 30;

//cord hider wall thickness
chwth = 2;


module hook()
{
difference()
{
cylinder(r=d/2+th, h=w);
cylinder(r=d/2, h=w);
translate([-d/2-th,0,0])
cube([d+th*2,d+th,w]);
}

difference()
{
translate([d/2,-th,0])
cube([tl+th, th, w]);

translate([d/2+th+tl/2,.1,w/2])
rotate([90,0,0])
cylinder(r=hd/2, h=th*2);
}
}

module disk()
{
R = bd/2;
c = dd;
echo(R);
echo(c);
h=R-sqrt(R*R-c*c/4);
echo(h);


difference()
{


intersection()
{
translate([0,0,-bd/2+h+1])
sphere(r=bd/2, $fn=200);
cylinder(r=dd/2, h=20);
}

//cylinder(r=7, h=h);

translate([0,0,-.1])
//cylinder(r1=3.5, r2=3, h=h+1);
cylinder(r=8, h=h+1+.2);
}

//OUTSOURCED TO SCREW__!!
/*
//screw hole
difference()
{
screw(slanted_head=false, pitch=2.5, threaded_width=14, head_height=0, non_threaded_length=h, threaded_length=14);

translate([0,0,-1])
cylinder(r=3, h=h+1+14+1);

translate([0,0,-1])
cylinder(r1=3.5, r2=3, h=h+2);

cube([20,2,50], center=true);
}
*/


}

module cap()
{
difference()
{
cylinder(r1=12, r2=9, h=14);
screw_thread(14, 2.5, 55, 20, 1.5,-2);
}

//nut(threaded_width=14, nut_width=16, nut_height=14, pitch=2.5);

//thread(10,14,2.5,55,14, 1.5);
}


module screw__()
{


//pegs to tighten cord
module peg()
{
translate([-1,0,4+7])
rotate([0,90,0])
cylinder(r=1, h=2, $fn=6);
}
translate([0,3.5,0])
peg();
translate([0,-3.5,0])
peg();

difference()
{
screw(slanted_head=false, pitch=2.5, threaded_width=14, head_height=4, head_width=20, non_threaded_length=5, threaded_length=14);

translate([0,0,-1])
cylinder(r=3.1, h=5+1+14+1+4);

translate([0,0,-1])
cylinder(r1=3.5, r2=3, h=5+2);

translate([0,0,4+25])
cube([20,2,50], center=true);
}
}

module cord_hider()
{
  
  
  difference()
  {

  union()
  {
  cube([chiw+chwth*2, chl+chwth*2, chih+chwth]);

  translate([0,chl+chwth*2,0])
  rotate([0,90,0])
scale([1,1.5,1])
  cylinder(r=chih+chwth, h=chiw+chwth*2);
  }


  //cord outcuts
  translate([chiw/2+chwth,100,0])
  rotate([90,0,0])
  cylinder(r=4, h=200);

  translate([chwth,chl+chwth*2,0])
  rotate([0,90,0])
scale([1,1.5,1])
  cylinder(r=chih, h=chiw);

  translate([chwth, chwth,0])
  cube([chiw, chl, chih]);
  

  translate([0,0,-30])
  cube([100,120,30]);
  }

  //side flanges
  translate([-10,0,0])
  cube([10,chl+chwth*2+(chih+chwth)*1.5,2]);

  translate([chiw+chwth*2,0,0])
  cube([10,chl+chwth*2+(chih+chwth)*1.5,2]);


  difference()
  {
  

  }

  

}

module long_cord_hider(length=100, flange=5)
{
  
  
    difference()
    {
      union()
      {
      rotate([-90,0,0])
      cylinder(r=7+2, h=length);
      translate([-18/2-flange,0,0])
      cube([18+flange*2,length,2]);
      }
      translate([0,-2,0])
      rotate([0,90,90])
      cylinder(r=7, h=length+3, $fn=6);

      translate([-20,-20,-9])
      cube([200,length+21,9]);
    }

}
//hook();

//cord_hider();
long_cord_hider();

//disk();
//translate([30,0,0])
//cap();

//translate([0,80,0])
//translate([0,0,20])
//rotate([180,0,0])
//screw__();

//hook();