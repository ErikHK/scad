$fn=40;

//thickness of each link
th =5;

//height of link
//h = 20;

//length of link
l = 15;

//angle
a = 33;


//vertical height
vh = h*sin(a);

//horiz height
hh = h*cos(a);

//fastener rod radius
frr = 1;
//give for the hole
give = .4;

//fastener rod distance
frd = 1;

module half()
{

difference()
{
translate([0,0,0])
rotate([0,a,0])
cylinder(r=th/2, h=l+th*tan(a)/2);

translate([0,-2.5,l*cos(a)])
cube([15,5,5]);


translate([-th/2,-2.5,-th*sin(a)/2])
cube([th*3,th*3,th*sin(a)]);

}

/*
difference()
{
translate([l*sin(a),0,(l)*cos(a)-th*tan(a)/2])
rotate([0,-a,0])
cylinder(r=th/2, h=l+th*tan(a)/2);


translate([0,-2.5,l*cos(a)-5])
cube([15,5,5]);
}
*/

}

module link()
{

//fastener rod
translate([frd,0,0])
cylinder(r=1, h=2*(l*cos(a)-th*sin(a)/2));


difference()
{
translate([0,0,-th*sin(a)/2])
{
half();
translate([0,0,l*cos(a)*2])
mirror([0,0,1])
rotate([0,0,0])
half();
}


//hole for fastener rod
translate([th*sqrt(1+tan(a)*tan(a))+frd*2,0,0])

cylinder(r=frr+give, h=2*(l*cos(a)-th*sin(a)/2));
}
}

link();


translate([th*sqrt(1+tan(a)*tan(a))+frd,0,0])
link();
