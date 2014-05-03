//width
w = 60;

//height
h = 25;

//length
l = 20;

//angle
a = 10;

//radius
r = 5.5;

//nut radius
nr = 9;

//nut height
nh = 7;

//hole();


rotate([-90,0,0])
difference()
{
rotate([90,0,0])
linear_extrude(height=l)
polygon(points=[[0,0],[0,h],[(w/2),h+(w/2)*tan(a)],[w,h],[w,0],[w/2,(w/2)*tan(a)]]);



union()
{
hole();


translate([w,0,0])
mirror([1,0,0])
hole();


//sideways hole
rotate([90,0,0])
translate([w/2,l/2+5,-1])
cylinder(r=r, h=40);


}

}

module hole()
{
translate([0,0,10])
rotate([0,a,0])
union()
{
translate([(3*w/4),-l/2,-4])
//rotate([0,a,0])
cylinder(r=r, h=40);


translate([(3*w/4),-l/2,-nh])
//rotate([0,a,0])
cylinder(r=nr, h=nh*2,$fn=6);
}
}



/*

mirror([1,0,0])
translate([-(1*w/3),l/2,-4])
rotate([0,a,0])
cylinder(r=r, h=40);



difference()
{
union()
{
cube([w,l,h]);
}

union()
{
translate([w/2,0,h])
rotate([0,a,0])
cube([w,l,h]);

mirror([1,0,0])
translate([-w/2,0,h])
rotate([0,a,0])
cube([w,l,h]);




translate([(2*w/3),l/2,-nh])
rotate([0,a,0])
cylinder(r=nr, h=nh*2);

}
}


rotate([0,180,0])
translate([w/2,0,-h/2])
rotate([0,a,0])
cube([w,l,h]);
*/