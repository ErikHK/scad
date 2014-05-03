scale([1.05,1.05,1.1])
rotate([0,90,0])
{

difference()
{

translate([-2.5-20,-2.5,-2])
cube([25,25,8]);


rotate([0,-90,0])
union()
{
cube([3.6,20,24]);
translate([3,2.5,0])
cube([3,15,24]);
translate([6,0,0])
cube([3,20,24]);
}

}

difference()
{
translate([-25+2.5,8,-12])
cube([25,3,10]);


union()
{
translate([-15,13,-7])
rotate([90,0,0])
cylinder(r=1.2, h=40, $fn=30);

translate([-5,13,-7])
rotate([90,0,0])
cylinder(r=1.2, h=40, $fn=30);


}

}


}