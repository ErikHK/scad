$fn = 40;

rr = 30/2;

module profile()
{
    ang = 40;
    polygon(points=[[0,10*cos(ang)], [7.5,10], [7.5,0], [0,10-10*cos(ang)]]);
}


difference()
{
  union()
  {
    cylinder(d=28, h=20);
    cylinder(d=44, h=12+2);
  }

translate([0,0,2])
rotate_extrude(convexity=10)
translate([44/2-7.4,0,0])
//rotate([0,90,0])
//circle(r=5, $fn=4);
  profile();
  
  
  cylinder(d=14.2, h=25);
  
  translate([4.5+1,-2.6,0])
  cube([5.2,5.2,25]);
}

nn = 40;
for(i=[1:nn])
{
  translate([rr*cos(i*360/nn),rr*sin(i*360/nn),0])
    rotate([0,0,i*360/nn])
    cube([6.9,.3,14]);
}