$fn=4;

for(i=[0:20])
{
  linear_extrude(height=15, twist=50, scale=1, $fn=300)
  translate([cos(i*18)*10,sin(i*18)*10,0])
  rotate(i*360/20+45)
  //cube(1);
  circle(r=1.2, $fn=4);
  //square(2);




  
}

//test-grej
//linear_extrude(height=20, twist=90)
//square(size=2);

//top
rotate_extrude(convexity=10, $fn=200)
rotate([90,0,0])
translate([.99*(10-.707), 1.0*(15-1.414),0])
polygon(points=[[0,0],1.2*[1.414,0],1.2*[1.414,1.414],1.2*[0,1.414]]);

//bottom
cylinder(r=10.1+.707,$fn=200, h=1);

/*
translate([10,1.5,14.6])
rotate([90,-5+180,90])
scale([2.6,2.4,1.4])
polygon(points=[[0,0], [0,1], [.5,.5], [1,1], [1,0]], paths=[[0,1,2,3,4]]);
*/