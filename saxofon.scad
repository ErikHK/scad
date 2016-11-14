$fn=100;


module torus(r1, r2)
{
    rotate_extrude(convexity = 10, $fn = 110)
    translate([r1, 0, 0])
    circle(r = r2, $fn = 100);
    
}

module mouth_piece()
{
translate([0,0,20])
cylinder(d=20, h=0.3);
difference()
{
union()
{
cylinder(d=24, h=90);
}

translate([-20,22,20])
rotate([20])
cube([40,20,100]);
    

translate([-24,-15-10+1+1,0])
rotate([-3])
cube([40,10,100]);
    
    

translate([-20,-15-10+.5+3.5+1 ,65])
rotate([-10])
cube([40,10,100]);
    

translate([0,-220,0])
rotate([0,90,0])
torus(221, 7);


cylinder(r=9, h=20);

translate([0,-7.5, 52])
rotate([8,0,0])
rotate([0,0,45])
cylinder(r1=7, r2=12, h=45, $fn=4);
    
}
}

module ligature()
{
  difference()
  {

  union()
  {
  cylinder(d=28, h=15);
   translate([-4,28/2-1,0])
  cube([2,10,15]);

  translate([2,28/2-1,0])
  cube([2,10,15]);
  }

  cylinder(d=24.5, h=16);
  
  translate([-2,0,0])
  cube([4,20,16]);

translate([-10,28/2+4,15/2])
  rotate([0,90,0])
  cylinder(d=6, h=20);
  }

  

  


  

}



ligature();

//mouth_piece();

