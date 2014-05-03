include <roundCornersCube.scad>

th = 10;
//d = 2;
//cube([121.6+th,63+th,9.9+d]);
scale=1;
dist=1;
//points=[1,1,1,1,1,1,1,1,1,.99,.97,.95,.92,.8,0];


points=[0,.92,.95,.97,.99,1,1,1,1,1,1,.99,.97,.94,0];

points2=[0,.8,.99,1];


//number of points
num_points = len(points);
num_points2 = len(points2);
twist = 0;

w=64;
h=121.6;
//d=9.9;
d = 15;

h_mm = 3;
w_mm = 3;
d_mm = 1.2;

w_s = (w+w_mm)/w;
h_s = (h+h_mm)/h;
d_s = (d+d_mm)/d;

//scale factor == 1 mm,
//krymp s mm i x- och y-led.
//den printade var 1.5!
scale_fact = 1.2;

module extrude()
{
  for(i=[1:num_points])
  {
  translate([0,0,(i-1)*dist])
  
  linear_extrude(height=dist, twist=twist/num_points, scale=points[i]/points[i-1])
  //translate([-50,-50,0])
  //import("ornament.dxf");
  rotate(-twist*i/num_points)
  //square(scale*points[i-1], center=true);
  scale(scale*points[i-1])
  thing();
  }
}

module extrude2()
{
  for(i=[1:num_points2])
  {
  translate([0,0,(i-1)*dist])
  
  linear_extrude(height=dist, twist=twist/num_points2, scale=points2[i]/points2[i-1])
  //translate([-50,-50,0])
  //import("ornament.dxf");
  rotate(-twist*i/num_points2)
  //square(scale*points[i-1], center=true);
  scale(scale*points2[i-1])
  thing();
  }
}

module thing()
{
//rotate([0,0,90])
translate([-63/2,-121.6/2,0])
//linear_extrude(height=3, scale=1)
  import(file="s3mini.dxf", center=true);
}


scale([(w-scale_fact)/w, (h-scale_fact)/h, 1])
{
difference()
{

translate([0,0,-d_mm])
scale([w_s, h_s, d_s]){
extrude();
}


union()
{

extrude();


//side buttons!
/*
translate([-w/2-4,h/2-30-25,5])
cube([15,25,3]);


translate([w/2-5,h/2-35,5])
cube([15,10,3]);
*/

//cam
translate([-7.5,h/2-15-23,-2])
//cube([15,20,3]);
rCube(15,23,3,2);

//speaker
translate([10,h/2-2-22,-2])
//cube([7,5,3]);
rCube(7,5,3,2);


translate([22,-40,-2])
linear_extrude(height=7)
scale(.25)
mirror()
import(file="s3_baksida.dxf", center=true);



translate([w/4,h/2+5,8])
rotate([90,0,0])
cylinder(h=20,r=2, $fn=30);

}


}
}

/*
difference()
{
scale(.94)
translate([-w/2,-h/2,12/.94])
linear_extrude(height=1)

import(file="s3mini.dxf", center=true);

translate([-w/2,-h/2+4+5,0])
cube([w+2,h,20]);

}


difference()
{
scale(.94)
translate([-w/2,-h/2,12/.94])
linear_extrude(height=1)

import(file="s3mini.dxf", center=true);

translate([-w/2,-h/2-4-3,0])
cube([w+2,h,20]);
}
*/