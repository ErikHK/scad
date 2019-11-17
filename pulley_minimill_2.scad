
$fn = 40;
d = 90;

//translate([4,-2,0])
//      cube([4,4,25]);

rr = 38.8;
for(i=[1:40])
{
  translate([rr*cos(i*360/40),rr*sin(i*360/40),0])
    rotate([0,0,i*360/40])
    cube([6,.5,14]);
}

difference()
{
  union()
  {
    cylinder(d=40+2+4+1, h=20+2);
    cylinder(d=d, h=12+2);
    
  }

translate([0,0,2])
rotate_extrude(convexity=10)
translate([d/2-6.9,0,0])
//rotate([0,90,0])
//circle(r=5, $fn=4);
  profile();
  
  cylinder(d=25.4+.4, h=25);
  
  
  translate([0,0,16+1+1])
  rotate([90,0,0])
  cylinder(d=3.5+1.5, h=200, $fn=20);
  
  translate([-8/2,-18.5+.5-.75,12+1.5])
    cube([8,4-1,25]);
}

module profile()
{
    ang = 40;
    polygon(points=[[0,10*cos(ang)], [7,10], [7,0], [0,10-10*cos(ang)]]);
}