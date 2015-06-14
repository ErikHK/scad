$fn = 30;

module spring(w = 30, h = 25, d = 1, sth = 1.5, th=25, n=6)
{
  a = asin(d/w);

  module spring_part(i=0)
  {
  rotate([0,0,a])
  cube([w,sth,th]);
  translate([w*cos(a),h*sin(a)+sth+.2,0])
  cylinder(d=sth*2+.2,h=th);

  translate([w*cos(a),w*sin(a)+sth,0])
  mirror([1,0,0])
  rotate([0,0,a])
  cube([w,sth,th]);
  
  if(i!=n)
  {
  translate([0*w*cos(a),2*(h*sin(a)+sth+.2),0])
  cylinder(d=sth*2+.3,h=th);
  }
  }

  for(i=[0:n])
  {  
    translate([0,i*(2*w*sin(a) + sth*2),0])
    spring_part(i);  
 
  }
  
}

module pulley_holder(w=30, th=25)
{

  difference()
  {
  hull()
  {
  cube([w,4,th]);
  translate([w/2,-20,0])
  cylinder(r=7, h=th);
  }

  translate([w/2,-20, 6])
  cylinder(r=16, h=12);

  translate([w/2,-20, -1])
  cylinder(r=4, h=120);
  }

}

module clamp(l=30, w=30, th=25)
{
  difference()
  {
  union()
  {
  cube([w,l,th]);
  hull()
  {
  translate([3,l,0])
  cylinder(r=3, h=th);
  translate([w-3,l,0])
  cylinder(r=3, h=th);
  }
  }

  translate([-1,3 + 3,4.5])
  cube([w+2,l,16]);


  translate([4,l-1,-1])
  cylinder(r=2.4, h=35);

  translate([w-4,l-1,-1])
  cylinder(r=2.4, h=35);
  }

}


spring();
pulley_holder();
translate([0,6*4*1.5-3,0])
clamp();

