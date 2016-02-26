$fn = 80;

//feet width
fw = 28;

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
dbf = .75;


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
  cube([lw, ll+1, h]);
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
  cylinder(d=8, h=fth-tg);
  }
  }
  
  translate([-2, ll-5, 0])
  cylinder(d=5, h=fth+10);
  
  translate([2.1,20.1-2,17.9])
  rotate([0,90,180])
    linear_extrude(height=20.2)
  polygon(points=[[18,18], [18,-2], [3,-2]], paths=[[0,1,2]]);
  
  
  
  translate([2,10,17])  
  rotate([0,90,90])
  linear_extrude(height=10)
  polygon(points=[[10,10], [10,-0], [0,-0]], paths=[[0,1,2]]);
    }
    
  translate([-2,ll-5,0])
  cylinder(d=4, h=fth-.5);
    
  
  
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
    
  translate([-24,0,3])
  cube([22+5,30, fth-10+3]);
      
  
  //translate([-2, ll-5, -.5])
  //cylinder(d=4+.6, h=fth+1);
  }
  
}

body();


hind_leg();


/*
foot();
mirror([1,0,0])
translate([dbf,0,0])
foot();
*/