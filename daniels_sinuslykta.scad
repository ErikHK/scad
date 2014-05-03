$fn=3;
th=10;
w=15;
h=1;
tol=0;
pi=3.1415;

module star()
{
//cube([1,1,1]);

circle(1);
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
//translate([0,0,-4.4])
//rotate([90,0,0])
union()
{
for(i=[1:h])
{

  translate([0,0,0])
  star();

}
}
}


//heela
module hela()
{
union()
{
for(i=[0:(60)])
{
  rotate([0,0,0])
  translate([cos(i*2*pi)*8,sin(i*2*pi)*8,sin(i*25)*2])
  //rotate([0,i*360/65,0])

  test();
  
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
//bottom();
top();


hela();
