$fn = 40;

//length
l = 50;

//width
w = 20;

//thickness
th = 2;


//////top fastener
//width
tfw = 8;

//length
tfl = 5;

//thickness
tfth = 1;


//////bottom fastener
//width
bfw = 8;

//bottom length
bfbl = 10;

//height
bfh = 10;

//top length
bftl = 20;

//thickness
bfth = 1.5;

//lip length
bfll = 3;

//lip width
bflw = 6;


module lucka(r1=3, r2=5)
{
  hull()
  {
  translate([r1,0,0])
  cube([l-r1-r2, th, w]);

  translate([3,2,3])
  rotate([90,0,0])
  cylinder(r=r1, h=th);

  translate([r1,2,-r1+w])
  rotate([90,0,0])
  cylinder(r=r1, h=th);


  translate([l-r2,2,-r2+w])
  rotate([90,0,0])
  cylinder(r=r2, h=th);

  translate([l-r2,2,r2])
  rotate([90,0,0])
  cylinder(r=r2, h=th);
  }

  module top_fastener(overlap=2)
  {
    translate([overlap-tfl,th,w/2-tfw/2])
    cube([tfl,tfth,tfw]);
  }

  top_fastener();

  module bottom_fastener()
  {
    translate([l-bfth,th,w/2-bfw/2])
    rotate([0,0,-10])
    cube([bfth,bfh,bfw]);


    translate([l-bfth+7,th,w/2-bfw/2])
    rotate([0,0,10])
    cube([bfth,bfh,bfw]);


      translate([l-bfth+4.25,th+10,w/2-bfw/2])
    {
    difference()
    {
    cylinder(r=2.5, h=bfw);
    cylinder(r=2.5-bfth+.2, h=bfw);
    translate([-5,-10-.5,0])
    cube([10,10,10]);
    }
    }

    
    translate([l-bfth+7,0,w/2-bflw/2])
    cube([bfll,bfth+.8,bflw]);
  }


  bottom_fastener();
}

module supports()
{
translate([-5.6,1.5,0])
cube([3,1.5,6]);

translate([l-2.3,12,0])
cube([3,1.5,6]);

translate([l+5.1,12,0])
cube([3,1.5,6]);

translate([l+2.1,14,0])
cube([1.5,3,6]);


translate([l+5.4,-.5,0])
cube([1.5,3,6]);


translate([l+5.4,-1.2,0])
cube([3,1.5,7]);



translate([l-2,10,0])
cube([10,7,1]);


}

color("blue")
supports();



lucka();