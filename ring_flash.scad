include <roundCornersCube.scad>

$fn = 60;

//ring inner width
riw = 25;

//ring thickness
rth = 12;

//ring wall thickness
rwth = 3;

//ring bottom thickness
rbth = 2;



//flex inner diameter
//fid = 77; 	//for nikon zoom lens 55-300
//fid = 67.5;	//for nikon 18-55 stock
fid = 70.3;			//for nikon 35mm 1.8


//inner diameter
id = fid+3;


//ring total width
rtw = riw*2+rwth*4+id;

module donut(d1=2, d2=1, h=1)
{
difference()
{
cylinder(d=d1, h=h);

cylinder(d=d2, h=h+.1);

}

}

module ring_flash()
{

for(i=[0:7])
{

translate([(id/2+rwth+riw/2)*cos(45*i), (id/2+rwth+riw/2)*sin(45*i),rbth])
rotate([0,0,45*i])
led_holder();
}

difference()
{
union()
{
cylinder(d=id+riw*2+rwth*4, h=rth);
//cube([id/2+riw/2+rwth,id/2+riw/2+rwth,rth]);

battery_box();


}
translate([0,0,-.05])
cylinder(d=id, h=rth+.1);


translate([0,0,rbth])
donut(d1=id+riw*2+rwth*2, d2=id+rwth*2, h=rth+12);

}
}


module flex_holder()
{
difference()
{

union()
{
cylinder(d=id+4, h=2);

translate([0,0,2])
cylinder(d=id, h=rth);


translate([0,0,2+rth])
cylinder(d1=id, d2=id+4, h=2);
}
translate([0,0,-.1])
cylinder(d=fid, h=rth+10);

}

}


module led_holder()
{
rad = 3.3;
//total width
w = 24.5;
//fastener height
fh = 1.65;

//width between fasteners
wf = 20;



difference()
{
/*
union()
{
translate([-w/2,-rad-1,0])
cube([w,rad*2+2,rad]);

translate([-rad-1,-w/2,0])
cube([rad*2+2,w,rad]);
}
*/
cylinder(d=w, h=rad);

translate([0,0,rad])
sphere(r=rad);
}

//fasteners
module fastener()
{
translate([-wf/2-2,-2.5,rad])
{
cube([2,5,fh+2]);
translate([2,5,1+fh])
rotate([90,0,0])
cylinder(r=1,h=5,$fn=4);
}
}

fastener();
mirror([1,0,0])
fastener();

}


module battery()
{
cube([57+2,31+2,28+2]);


}

module battery_box()
{
/*
translate([rtw/2-1,rtw/4,0])
rotate([0,0,-90])
battery();
*/

translate([rtw/2-20,rtw/3,0])
rotate([0,0,-90])
difference()
{
rCube(rtw/1.5,55+3,20,10);

translate([rwth,rwth,rbth*2])
rCube(rtw/1.5-rwth*2,55+3-rwth*2,22,10);
}
}


//translate([0,0,-2])
//flex_holder();
ring_flash();


//translate([id/2+rwth+riw/2,0,rbth])
//led_holder();
