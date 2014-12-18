$fn = 60;

//ring inner width
riw = 30;

//ring thickness
rth = 10;

//ring wall thickness
rwth = 4;

//ring bottom thickness
rbth = 2;

//ring total width
rtw = riw+rwth*2;


//flex inner diameter
//fid = 77; 	//for nikon zoom lens 55-300
//fid = 67.5;	//for nikon 18-55 stock
fid = 70.3;			//for nikon 35mm 1.8


//inner diameter
id = fid+3;


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



difference()
{
union()
{
cylinder(d=id+riw+rwth*2, h=rth);
//cube([id/2+riw/2+rwth,id/2+riw/2+rwth,rth]);

}
translate([0,0,-.05])
cylinder(d=id, h=rth+.1);


translate([0,0,rbth])
donut(d1=id+riw+rwth, d2=id+rwth, h=rth+2);

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

translate([0,0,-2])
flex_holder();
//ring_flash();