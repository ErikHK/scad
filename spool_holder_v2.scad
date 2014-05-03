//width
w = 50;

//height
h = 20;

//length
l = 24;

//angle
a =35;

//radius
r = 5.5;

//nut radius
nr = 10.5;

//nut height
nh = 7;





rotate([-90,0,0])
difference()
{
//rotate([90,0,0])
/*
linear_extrude(height=l)
polygon(points=[[0,0],[0,h],[(w/2),h+(w/2)*tan(a)],[w,h],[w,0],[w/2,(w/2)*tan(a)]]);
*/
union()
{
translate([-h*sin(a),0,0])
cube([h*sin(a)*2,l,h*cos(a)]);


rotate([0,a,0])
cube([w/2,l,h]);

rotate([0,-a,0])
translate([-w/2,0,0])
cube([w/2,l,h]);
}



union()
{
translate([(w/4)*cos(a),l/2,-(h/2)*cos(a)-1])
hole();

translate([-(w/4)*cos(a),l/2,-(h/2)*cos(a)-1])
mirror([1,0,0])
hole();
}


rotate([90,0,0])
translate([0,h*cos(a)/2,-h*2-1])
cylinder(r=r, h=h*3);


}

module hole()
{
//translate([0,0,10])
rotate([0,a,0])
union()
{
//translate([(4*w/5),-l/2,-0])
//rotate([0,a,0])
cylinder(r=r, h=40);


//translate([(4*w/5),-l/2,-nh])
//rotate([0,a,0])

//hex hole
//cylinder(r=nr, h=nh*2,$fn=6);
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