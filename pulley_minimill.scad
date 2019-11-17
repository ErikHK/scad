
module profile()
{
    ang = 40;
    polygon(points=[[0,10*cos(ang)], [7.5,10], [7.5,0], [0,10-10*cos(ang)]]);
}


difference()
{
  union()
  {
    cylinder(d=20, h=20);
    cylinder(d=41, h=12+2);
  }

translate([0,0,2])
rotate_extrude(convexity=10)
translate([41/2-7.4,0,0])
//rotate([0,90,0])
//circle(r=5, $fn=4);
  profile();
  
  
  cylinder(d=11.3, h=25);
  
  translate([4.5,-2,0])
  cube([4,4,25]);
}