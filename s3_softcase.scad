include <roundCornersCube.scad>

th = 10;
//d = 2;
//cube([121.6+th,63+th,9.9+d]);
scale=1;
dist=1;
//points=[1,1,1,1,1,1,1,1,1,.99,.97,.95,.92,.8,0];


points=[0,.92,.95,.97,.99,1,1,1,1,.99,0];

points2=[0,.8,.99,1];


//number of points
num_points = len(points);
num_points2 = len(points2);
twist = 0;

w=64;
h=121.6;
//d=9.9;
d = 15;

h_mm = 2;
w_mm = 2;
d_mm = 2;

w_s = (w+w_mm)/w;
h_s = (h+h_mm)/h;
d_s = (d+d_mm)/d;

//scale factor == 1 mm,
//krymp 1 mm x- och y-led.
scale_fact = 1.5;

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

translate([-w/2-4,h/2-30-25,2])
cube([15,25,3]);


translate([w/2-5,h/2-35,2])
cube([15,10,3]);


//cam
translate([-7.5,h/2-15-20,-2])
//cube([15,20,3]);
rCube(15,20,3,2);

//speaker
translate([10,h/2-2-20,-2])
//cube([7,5,3]);
rCube(7,5,3,2);


translate([22,-30,-1])
linear_extrude(height=1)
scale(.25)
mirror()
import(file="s3_baksida.dxf", center=true);




}


}
}

