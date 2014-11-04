include <polyScrewThread_r1.scad>
use <../mek/screws.scad>








module light_cap()
{
difference()
{
//cap
translate([0,0,0])
cylinder(r=26/2+2, h=12);

//diameter, pitch, angle, length, const, const
translate([0,0,4])
screw_thread(26.5, 2.5, 50, 10, 1.5,0);
}

}



module bottom_cap()
{
//bottom cap
translate([0,50,0])
difference()
{
//cap
translate([0,0,-3])
cylinder(d=30.5, h=10);

//diameter, pitch, angle, length, const, const
screw_thread(28.5, 2.5, 50, 18, 1.5,0);
}
}


module body()
{
//rotate([180,0,0])
//translate([50,0,0])
difference()
{
union()
{



screw(slanted_head=false, pitch=2.5, threaded_width=25.5, head_height=0, head_width=20, non_threaded_length=0, threaded_length=8, angle=50);

translate([0,0,60])
screw(slanted_head=false, pitch=2.5, threaded_width=27.5, head_height=0, head_width=20, non_threaded_length=0, threaded_length=5+2, angle=50);

translate([0,0,12])
cylinder(d=30, h=38+5);

translate([0,0,8])
cylinder(d1=26, d2=29, h=4);

translate([0,0,48+5])
cylinder(d=28, h=5+2);

}
translate([0,0,14])
cylinder(d=23, h=550);


translate([0,0,-2])
cylinder(d=20-6, h=550);


//ridge thingy
translate([0,0,13])
rotate_extrude(convexity=10)
translate([19,0,0])
circle(r=5, $fn=9);
}
}


//inner radius
ir = 15;

//thickness
th = 5;

//ring height
rh = 10;

//band thickness
bth = 3;

//band width
bw = 20;

//band length
bl = 70;


//ninjaflex thingy
module thingy()
{
translate([-50,0,0])
{



difference()
{
  cylinder(r=ir+th, h=rh);
  translate([0,0,-.1])
  cylinder(r1=ir, r2=ir, h=11);
  
  /*
  translate([0,0,1.89])
  cylinder(r=ir, h=4);

  translate([0,0,5.88])
  cylinder(r=ir, h=4);

  translate([0,0,5.88+1.8+.4])
  cylinder(r1=ir, r2=ir+2, h=2);
  */
}



translate([-bw/2, ir+2,0])
cube([bw,bl-2, bth]);


translate([0,bl+ir*2,0])
difference()
{
  cylinder(r=ir+th, h=rh);
  translate([0,0,-1])
  cylinder(r=ir, h=rh+2);
}

//finger hole
translate([0,-ir-th*3+3.14])
{
difference()
{

cylinder(r=12,h=10);

cylinder(r=9,h=10);
}
}

}

}



light_cap();
//bottom_cap();
//thingy();
//body();