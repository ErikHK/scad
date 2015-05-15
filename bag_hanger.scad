//square width
sw = 40;

//rod diameter
rd = 10;

//screw diameter
sd = 9.8;

//screw padding
sp = 18;

//thickness
th = 5;

//hanger height
hh = 40;

//hanger thickness
hth = 7;

//hanger width
hw = 20;


rotate([90,0,0])
bag_hanger();



module bag_hanger()
{
fastener();


translate([sw,0,0])
fastener();

translate([0,0,sw+sp])
cube([sw+th,sw/2,th]);

translate([0,0,sw+sp])
{
hanger();
}

}


module fastener()
{
difference()
{
cube([th,sw/2,sw+sp]);
translate([-th*.5,sw/4,sp/2])
rotate([0,90,0])
cylinder(d=sd, h=th*2);
}
}


module hanger()
{
difference()
{
union()
{
cube([hw,hth,hh-hw/2]);
translate([hw/2,hth,hh-hw/2])
rotate([90,0,0])
cylinder(d=hw, h=hth);
}

translate([hw/2,hth*1.5,hh-hw/2])
rotate([90,0,0])
cylinder(d=rd, h=hth*2);
}

}