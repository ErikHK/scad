$fn=40;

//thickness of each link
th =7;

//height of link
//h = 20;

//length of link
l = 20;

//angle
a = 33;


//vertical height
vh = h*sin(a);

//horiz height
hh = h*cos(a);

//fastener rod radius
frr = 1.71;
//give for the hole
give = .4;

//fastener rod distance
frd = 1;


//number of links
num = 5;


el = th*sqrt(1+tan(a)*tan(a))+frd+.3;
echo(l);

pi = 3.1415;


snap = .6;


module half()
{

difference()
{
translate([0,0,0])
rotate([0,a,0])
cylinder(r=th/2, h=l+th*tan(a)/2);

translate([0,-th/2,l*cos(a)])
cube([th*3,th,th]);


translate([-th/2,-th/2,-th*sin(a)/2])
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
cylinder(r=frr, h=2*(l*cos(a)-th*sin(a)/2));


difference()
{
translate([0,0,-th*sin(a)/2])
{
half();
translate([0,0,l*cos(a)*2-.01])
mirror([0,0,1])
rotate([0,0,0])
half();
}


//hole for fastener rod
translate([th*sqrt(1+tan(a)*tan(a))+frd*2,0,0])

cylinder(r=frr+give, h=2*(l*cos(a)-th*sin(a)/2));
}
}


module last_link()
{
difference()
{
link();
translate([th*sqrt(1+tan(a)*tan(a))+frd*2+frd*3-frr,-frr+snap/2,0])
//cylinder(r=frr-snap,h=200);
cube([frr*2,frr*2-snap,200]);
}
}




//regular in a row etc
module links(rows=1, cols=num)
{
//translate([0,j*el,0])
for(i=[0:cols-2])
{


translate([i*(th*sqrt(1+tan(a)*tan(a))+frd),0,0])
link();



}

//add the end link:
translate([(num-1)*(th*sqrt(1+tan(a)*tan(a))+frd),0,0])
last_link();
}

links(rows=2);




/*
//test with a circle!
//naaaw, too much work..
rad = el*num/(2*pi);
ang = atan2(el,rad);
for(i=[0:num+1])
{
//translate([i*(th*sqrt(1+tan(a)*tan(a))+frd),0,0])
translate([rad*cos(i*ang), rad*sin(i*ang)])
rotate([0,0,i*ang+90+rad/2])
link();

}
*/


