$fn=50;

enlong = 20;

rad = 1.6;
//cylinder(r=2,h=32);



sak();

module enlongate()
{
  cube([40,enlong,3]);
}

//enlongate();

//translate([0,enlong,0])
//sak();
/*
difference()
{

union()
{
translate([0,-2.1,0])
cube([40,3,3]);


translate([0,0,2.1])
rotate([45+90,0,0])

cube([40,8,3]);
//sak();
}

translate([0,0,2.1])
rotate([45+90,0,0])

union()
{
translate([5,4,-1])
cylinder(r=1.8, h=10);

translate([31+5,4,-1])
cylinder(r=1.8, h=10);

translate([5,4,-1])
cylinder(r=3, h=3);

translate([31+5,4,-1])
cylinder(r=3, h=3);


}
}

*/
/*
hull()
{
translate([5,5,0])
cylinder(r=5,h=3);
translate([31+5,5,0])
cylinder(r=5,h=3);
}
*/


//translate([0,0,0])
//rotate([90,0,0])

module sak()
{
union()
{
difference()
{
  union()
  {
    translate([20,20,0])
    hull()
{
cylinder(r=20,h=5);
translate([4,0,13])
cylinder(r=16,h=1);
translate([8,0,18])
cylinder(r=12,h=1);

translate([8,0,25])
cylinder(r=8,h=1);

translate([8,0,30])
cylinder(r=6,h=1);
}


    cube([40,40,2]);
    translate([20,20,0])
    cylinder(r=20,h=3);
  }

  union()
  {
    translate([4,4,-.1])
    cylinder(r=rad,h=5);

    translate([32+4,4,-.1])
    cylinder(r=rad,h=5);

    translate([4,32+4,-.1])
    cylinder(r=rad,h=5);

    translate([32+4,32+4,-.1])
    cylinder(r=rad,h=5);

translate([20,20,-.1])
hull()
{
cylinder(r=19,h=5);
translate([4,0,13])
cylinder(r=15,h=1);
translate([8,0,18])
cylinder(r=11,h=1);

translate([8,0,25])
cylinder(r=7,h=1);

translate([8,0,30])
cylinder(r=5,h=2);
}
    
  }
}
}
}