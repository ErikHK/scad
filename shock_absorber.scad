th=2;
w = 6.4;

translate([0,-3,0])
cube(w);

translate([-20-w,-3,0])
cube(w);

difference()
{
translate([-10,0,0])
union()
{
  translate([-10,-15,0])
  cube([20,30,w]);
  
  translate([0,15,0])
  cylinder(h=w, r=10, center=false);


  translate([0,-15,0])
  cylinder(h=w, r=10, center=false);

}


translate([-10,0,-.1])

union()
{
  translate([-10+th,-15,0])
  cube([20-2*th,30,6+th]);
  
  translate([0,15,0])
  cylinder(h=w+th, r=10-th, center=false);


  translate([0,-15,0])
  cylinder(h=w+th, r=10-th, center=false);

}

}