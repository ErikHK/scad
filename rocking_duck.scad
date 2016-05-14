$fn = 80;

//feet width
fw = 32;

c = fw*2;

//feet height
fh = 10;

//feet thickness
fth = 40;

//feet diameter
fd = 2*(fh/2 + c*c/(8*fh));

//leg length
ll = 20;

//leg width
lw = 10;

//distance between feet
dbf = .75+.25;


module foot()
{
translate([0,fd/2-fh,0])
intersection()
{
cylinder(d=fd, h=fth);
translate([0,-fd/2,-.2])
color("red")
cube([fw, fh, fth+2]);
}
}

module front_leg(h=fth)
{
  foot();
  translate([fw/2-lw/2+1,-8,0])
  rotate(20)
  cube([lw, ll+3, h]);
}

module hind_leg()
{
  //top give
  tg = 5;
  difference()
  {
  union()
  {
  
  mirror(1)
  {
  foot();
  translate([fw/2-lw/2-1,0,0])
  cube([lw, ll, fth-tg]);
  }
  hull()
  {
  translate([-fw/2-lw/2+1, ll-10, 0])
  cube([lw, 10, fth-tg]);
  translate([-2, ll-5, 0])
  cylinder(d=8+2.5, h=fth-tg);
  }
  }
  
  translate([-2, ll-5, 0])
  cylinder(d=8.5, h=fth+10);
  
 translate([-25,0,-.01])
mirror([0,0,1])
  rotate([0,90,0])
    linear_extrude(height=30)
  polygon(points=[[0,0], [0,22], [22,22]], paths=[[0,1,2]]);
  
  
  
  translate([2,9.9-.2,19.3])  
  rotate([0,90,90])
  linear_extrude(height=14)
  polygon(points=[[12,12], [12,-2], [0,-2]], paths=[[0,1,2]]);
    }
    
  translate([-2,ll-5,0])
  cylinder(d=4+3, h=fth-.5);
    




  
}

module body()
{
  difference()
  {
  union()
  {
  translate([-55,5,0])
  linear_extrude(height=fth)
  import("duck_simple.dxf");
      
  translate([dbf,0,0])
  front_leg();
  }
    
  translate([-27,0,3])
  cube([22+7+2,30, fth-10+3]);
      
  
  //translate([-2, ll-5, -.5])
  //cylinder(d=4+.6, h=fth+1);
  }
  
}

//body();


hind_leg();


/*
foot();
mirror([1,0,0])
translate([dbf,0,0])
foot();
*/