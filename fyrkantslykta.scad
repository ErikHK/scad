$fn=80;
th=10;
w=15;
h=3;
tol=0;

module star()
{
cube([20,5,10]);
}

/*
star();
translate([5,3,0])
star();

translate([10,0,0])
star();

translate([5,-3,0])
star();
*/
module test()
{
translate([0,0,-4.4])
rotate([90,0,0])
union()
{
for(i=[1:h])
{

  translate([0,(6-tol)*i,0])
  star();

}
}
}


//heela
module hela()
{
union()
{
for(i=[0:10])
{
  translate([cos(i*9*4)*5*3/2,sin(i*9*4)*5*3/2,0])
  rotate(i*360/(10)+90)

  if(i%2==0){
  translate([0,0,-3])
  test();
  }
  else{
  test();
  }
}
}
}


module top()
{
translate([0,0,10])
difference()
{
cylinder(r=9,h=1);
translate([0,0,-.2])
cylinder(r=7.5,h=4);
}

}

module bottom()
{
translate([0,0,-2])
cylinder(r=9,h=2);

}
bottom();
top();

intersection()
{
hela();
difference()
{
cylinder(r=9,h=10);
cylinder(r=8,h=10);
}
}