th = 10;
d = 2;
//cube([121.6+th,63+th,9.9+d]);
scale=1;
dist=1;
points=[1,1,1,1,1,.99,.97,.95,.92,.8,0];
//number of points
num_points = len(points);
twist = 0;



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

module thing()
{
rotate([0,0,90])
translate([-63/2,-121.6/2,0])
//linear_extrude(height=3, scale=1)
  import(file="s3mini.dxf", center=true);
}




translate([0,0,2+10])
mirror([0,0,1])
difference()
{
//translate([-121.6/2,0,0])
//cube([121.6+th,63+th,9.9+d]);

scale([1.17,1.17,1.2])
translate([0,0,2])
extrude();
union()
{


translate([20,-10,-10])
cube([30,20,30]);


scale([3,3,1])
translate([-121.6/2,-63/2,12])

cube([121.6,63,9.9]);

scale(1.05)
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
