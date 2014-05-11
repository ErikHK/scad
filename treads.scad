use <../mek/plate_ny.scad>
include <../mek/inc/constants.scad>

$fn=20;

//thickness of each link
th =8;

//height of link
//h = 20;

//length of link
l = 18;

//angle
a = 40;


//vertical height
vh = h*sin(a);

//horiz height
hh = h*cos(a);

//fastener rod radius
frr = 2.3;
//give for the hole
give = .6;

//fastener rod distance
frd = .4;


//number of links
num = 4;


el = th*sqrt(1+tan(a)*tan(a));
echo(l);

pi = 3.1415;


snap = .6;


module just_tread()
{

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


}
}

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
for(i=[0:cols-1])
{


translate([i*(th*sqrt(1+tan(a)*tan(a))+frd),0,0])
link();



}

//add the end link:
//translate([(num-1)*(th*sqrt(1+tan(a)*tan(a))+frd),0,0])
//last_link();
}




//translate([4*(el+frd),2,0])

//translate([frd+4*(el+frd),0,0])

module links_turn()
{

module link_rot(angle=45)
{
rotate([0,0,angle])
translate([-frd+frd,0,0])
link();
}
translate([el+frd,0,0])
{
translate([-(el+frd),0,0])
link();
link_rot();

translate([((el+frd))/sqrt(2),(el+frd)/sqrt(2),0])
{
link_rot(90);

translate([0,(el+frd),0])
{
link_rot(90+45);

translate([-(el+frd)/sqrt(2),(el+frd)/sqrt(2),0])
link_rot(90+90);
}
}
}
}



module 20_links()
{
links(rows=2);

translate([4*(el+frd),0,0])
links_turn();


//translate([(el+frd)*4,(1+sqrt(2))*(el+frd),0])
translate([-2*frd+(el+frd)*4,26.17,0])
rotate([0,0,180])
translate([-frd*2,0,0])
links(1,5);

translate([-(el+frd),(1+sqrt(2))*(el+frd),0])
rotate([0,0,180])
//mirror([0,1,0])
links_turn();

translate([-el-frd,0,0])
link();
}

//20_links();




module links_(rows=5, cols=5)
{
for(i=[0:rows-1])
{
  if(i%2==0 && i!=rows-1)
  {
  translate([(cols-1)*(el+frd),(i)*(1+sqrt(2))*(el+frd),0])

  links_turn();
  }
  else if(i!=rows-1)
  {
  translate([0,(i)*(1+sqrt(2))*(el+frd),0])
  rotate([0,0,180])
  mirror([0,1,0])
  links_turn();

  }


  translate([0,i*(1+sqrt(2))*(el+frd),0])
  for(j=[0:cols-2])
  {
    if(i%2==0)
    {
    translate([j*(el+frd),0,0])
    link();
    }
    else
    {
    translate([(j+1)*(el+frd),0,0])
    mirror([1,0,0])
    link();
    

    }
  }
}


//TODO:
//also add last link!!!11

}

//links_();

//translate([3,13.1,0])

ang=40;
rad=18;

difference()
{
translate([0,0,.1])
cylinder(r=rad-2, h=22.2);


cylinder(r=hr+ggive, h=30, $fn=6);

for(i=[0:360/ang])
{
translate([cos(i*ang)*rad, sin(i*ang)*rad,0])
rotate([0,0,i*ang+90])
translate([-frd-5,0,0])
scale(1.12)
just_tread();
}
}

//translate([el+frd,0,0])
//just_tread();



echo((1+sqrt(2))*(el+frd));

/*
translate([28,3,0])
20_links();

plate(4,2);
*/