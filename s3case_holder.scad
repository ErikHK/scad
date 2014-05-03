/*mt = 3;
ht = 3;
lt = 3;
s=1.3;

translate([0,0,-lt])
rotate([180,0,0])
linear_extrude(height=lt, scale=[s,1], center=true)
square([20,30], center=true);


cube([20,30,mt],center=true);

translate([0,0,lt])
linear_extrude(height=ht, scale=[s,1], center=true)
square([20,30], center=true);
*/

difference()
{
union()
{
cube([3,20,20]);
translate([3,2.5,0])
cube([3,15,20]);
translate([6,0,0])
cube([3,20,20]);
}


union()
{
translate([6,10,5])
rotate([0,90,0])
cylinder(h=20,r=3.1,$fn=6);

translate([-.1,10,15])
rotate([0,90,0])
cylinder(h=20,r=1.5,$fn=20);



translate([6,10,15])
rotate([0,90,0])
cylinder(h=20,r=3.1,$fn=6);

translate([-.1,10,5])
rotate([0,90,0])
cylinder(h=20,r=1.5,$fn=20);

}
}



