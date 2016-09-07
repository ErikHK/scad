include <roundCornersCube.scad>

//bearing diameter
bd = 35;

//bearing thickness
bth = 10; //?

//bearing inner diameter
bid = 16.9; //?

//bearing holder width
bhw = 40;

//bearing holder thickness
bhth = bth+5;

//screw holder width
shw = 65;

//screw hole distance
shde = 50;

//screw hole diameter
shd = 6.5;

//screw holder thickness
shth = 10;

//give
g = .5;



difference()
{
    rCube(bhw,bhw,bhth,3);
    translate([bhw/2, bhw/2, bhth-bth])
    cylinder(d=bd+g, h=bth+.1);
    translate([bhw/2, bhw/2, -.1])
    cylinder(d=bid+5, h=bth+.1);
}

difference()
{
//screw holder
translate([-shw/2+bhw/2,-shth+2.3])
rCube(shw, shth, bhth, 2);

//screw holes
translate([bhw/2+shde/2,4,bhth/2])
rotate([90,0,0])
cylinder(d=shd, h=20);

translate([bhw/2-shde/2,4,bhth/2])
rotate([90,0,0])
cylinder(d=shd, h=20);

}