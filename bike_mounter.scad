$fn=40;
//inner width
//iw = 26;
iw = 30;
//thickness
th = 2;
//width
w = 15;

//corner to corner hex nut = 6.01
//rad = 3.1;
rad = 3.5;

difference()
{

cylinder(h=w, r=iw/2);
translate([0,0,-1])


union(){
cylinder(h=w*2, r=iw/2-th);


translate([iw/2-th*2,1,0])
rotate([90,0,0])
cube([w*2,w*2,2]);
}
}



difference()
{



translate([iw/2-th,5,0])
rotate([90,0,0])
cube([w,w,th*2]);


union()
{

translate([iw/2+5,6,w/2])
rotate([90,0,0])
cylinder(r=rad,h=4, $fn=6);


translate([iw/2+5,7,w/2])
rotate([90,0,0])
cylinder(r=1.52,h=22);
}
}


difference()
{

translate([iw/2-th,-1,0])
rotate([90,0,0])
cube([w,w,th*2]);


translate([iw/2+5,7,w/2])
rotate([90,0,0])
cylinder(r=1.6,h=22);
}