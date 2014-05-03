th = 10;
//d = 2;
//cube([121.6+th,63+th,9.9+d]);
scale=1;
dist=1;
//points=[1,1,1,1,1,1,1,1,1,.99,.97,.95,.92,.8,0];


points=[0,.92,.95,.97,.99,1,1,1,1,1,1,1,1,1,1];

points2=[0,.8,.99,1];


//number of points
num_points = len(points);
num_points2 = len(points2);
twist = 0;

w=64;
h=121.6;
//d=9.9;
d = 15;

h_mm = 5;
w_mm = 5;
d_mm = 4;

w_s = (w+w_mm)/w;
h_s = (h+h_mm)/h;
d_s = (d+d_mm)/d;


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


/*

translate([0,0,2+10])
mirror([0,0,1])
difference()
{
//translate([-121.6/2,0,0])
//cube([121.6+th,63+th,9.9+d]);

scale([1.06,1.1,1.2])
translate([0,0,2])
extrude();
union()
{


translate([-121/2+15,-10,-10])
cube([30,20,30]);



scale([3,3,1])
translate([-121.6/2,-63/2,17])
cube([121.6,63,9.9]);


scale(1.01)
extrude();


translate([0,-10,-3])
{
  cylinder(r=3,h=20,$fn=40);
  cylinder(r=5,h=14,$fn=40);
}

translate([0,10,-3]){
  cylinder(r=3,h=20,$fn=40);
  cylinder(r=5,h=14,$fn=40);
}
}

}
*/


/*
translate([0,0,10])
linear_extrude(height=dist, twist=twist/num_points, scale=points[i]/points[i-1])
thing();
*/
scale(1.015)
{
difference()
{
translate([0,0,0])
scale([w_s,h_s,d_s])
extrude()
thing();


union()
{
translate([-7.5,h/2-20-30-h_mm,-10])
cube([15,30,30]);



translate([0, 0, d_mm])
scale([1,1,d_s])
extrude()
thing();


translate([w/4,h/2-30+5,0])
cube([2,30,d*2]);

translate([-w/4-3.5,h/2-30+5,0])
cube([2,30,d*2]);

}

}



difference()
{
translate([0,0,22])
//scale([w_s,h_s,1])

rotate([180,0,0])
extrude2();

translate([-100, -h/2+10, 0])
cube([200,200,50]);
}
}



/*
translate([0,0,7])
linear_extrude(height=11)
thing();
*/

translate([-w/4-1,h/2-1,19.3])
rotate([0,90,0])
linear_extrude(height=33)
polygon(points=[[0,0],[0,2],[5,2],[2,0]]);
