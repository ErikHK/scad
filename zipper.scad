$fn=20;

//piece width
pw = 8;

//piece height
ph = 4;

//piece length
pl = 4;

//piece radius 1
pr1 = pw/2;

//distance to anti-circle
dtac = [pr1*sqrt(3)/2,
(sqrt(2)+1)*pr1];

//distance to circle
dtc = pr1+(sqrt(2)-1)*pr1+dtac[0];

//total length
tl = pl+dtc+pr1;

//notch length
nl = 6;

//band width (heh)
bw = 6;

//band height
bh = ph/2;

//slider length
sl = 25;

//slider triangle width
stw = 3;

//slider triangle length
stl = 10;

//slider base height
sbh = 2;

//slider top holder height
sthh = 10;

//slider top holder width
sthw = 3;

//slider top holder length
sthl = 15;


//slider top holder hole radius
sthhr = 3;

//slider wall support 
sws = .2;

//slider give
sg = 1;

//give
g = .3;

//notch give
ng = .5;

module piece()
{

//notch
module notch(l=nl, r=ph/3+ng/2)
{
  //translate([tl-pr1-3,0,ph/2])
  translate([0,0,ph/2])
  rotate([0,90,0])
  cylinder(r=r,h=l, $fn=4);
}


cube([pl,pw,ph]);

//protrusions
translate([dtac[0]+pl-3/2,-dtac[1]+pw+pr1,0])
notch(r=ph/3, l=3);

translate([dtac[0]+pl-3/2,dtac[1]-pr1,0])
notch(r=ph/3, l=3);


difference()
{
union()
{
translate([pl+dtc,pw/2,0])
cylinder(r=pr1, h=ph);

translate([pl,0,0])
cube([pr1+2,pw,ph]);
}

//notches
translate([tl-pr1-3,0,0])
notch();
translate([tl-pr1-3,pr1*2,0])
notch();

//front notch
translate([tl,0,0])
rotate([0,0,90])
notch(l=pw);



translate([pl+dtac[0],dtac[1],-.1])
cylinder(r=pr1, h=ph+1);

translate([pl+dtac[0],-dtac[1]+pw,-.1])
cylinder(r=pr1, h=ph+1);

}

}


module zipper(links=10)
{

for( i=[0:links-1])
{
translate([0,i*(pw*1.5+g*2),0])
piece();
}

//band
//band length
bl = (links-1)*(pw*1.5+g*2)+pw;
translate([-bw,0,0])
cube([bw+pl, bl, bh]);


/*
translate([tl*2-pr1*2-dtc+dtac[0],pw-pr1/2+g,0])
mirror([1,0,0])
piece();
*/
}


module slider()
{
  //slider total height
  sth = bh*2+ph+sg;

  module slider_part()
  {
  //slider width
  sw = tl+pl+sg;
  //triangle
  translate([0,0,sbh])
  linear_extrude(height=ph+sg)
  polygon(points=[[0,0],[stw/2,0],[0,-stl]]);

  //slider base
  linear_extrude(height=sbh)
  polygon(points=[[0,0],[sw/2+sbh+stw/2+sg,0],[sw/2+sbh,-sl],[0,-sl]]);
  
  //slider wall
  translate([0,0,sbh+bh+sg])
  linear_extrude(height=ph+sg-bh)
  polygon(points=[[sw/2+sg+stw/2,0],[sw/2+sbh+stw/2+sg,0],[sw/2+sbh,-sl],[sw/2,-sl]]);

  //slider wall support
  translate([0,0,sbh])
  linear_extrude(height=ph+sg-bh)
  polygon(points=[[sw/2+sg+stw/2+sbh-sws,0],[sw/2+sbh+stw/2+sg,0],[sw/2+sbh,-sl],[sw/2+sbh-sws,-sl]]);


  //slider top
  translate([0,0,bh+ph+sg])
  linear_extrude(height=sbh)
  polygon(points=[[0,0],[sw/2+sbh+stw/2+sg,0],[sw/2+sbh,-sl],[0,-sl]]);

  //slider top holder
  difference()
  {
  translate([0,-sthl,sth])
  cube([sthw,sthl,sthh]);

  translate([0,-sthl/2,sth+sthh/2])
  rotate([0,90,0])
  cylinder(r=sthhr, h=sthw*2);
  }

  }

  union()
  {
  slider_part();
  mirror([1,0,0])
  slider_part();
  }

}

slider();

/*
zipper();
translate([tl*2-pr1*2-dtc+dtac[0],pw-pr1/2+g,0])
mirror([1,0,0])
zipper();
*/