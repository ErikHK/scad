
use <involute_gears.scad>
$fn = 20;

//bearing diameter
bd = 22;

//bearing height
bh = 7;

//bearing diameter give
bg = .6;

//motor diameter
md = 38;

//motor height
mh = 53;

//bearing inner diameter
bid = 8;

//bearing inner diameter give
bidg = .4+.1;

//wall thickness
wth = 4;

//pulley height
ph = 6+4;

//pulley outer diameter
pod = 45;

//pulley inner diameter
pid = 40;

//small pulley outer diameter
spod = 20;
//small pulley inner diameter
spid = 16;
//screw hole diameter
shd = 3+.7;

//spacer give
sg = .6;

//motor rod diameter
mrd = 7.2;


module shaft(length=70)
{
  translate([0,0,(sqrt(3)/2)*(bid-bidg)/2])
  rotate([90,0,0])
  cylinder(d=bid-.2, h=length, $fn=6);
}

module motor_holder()
{
  translate([md/2,-5,0])
  tab();

  translate([-md/2,5,0])
  rotate(180)
  tab();

  translate([5,md/2,0])
  rotate(90)
  tab();

  translate([-5,-md/2,0])
  rotate(-90)
  tab();

  translate([md/2,-5,mh+wth])
  uptab();

  translate([-md/2,5,mh+wth])
  rotate(180)
  uptab();

  translate([5,md/2,mh+wth])
  rotate(90)
  uptab();


  //translate([0,-md/2-wth,0])
  //cube([120,md+wth*2,wth]);

  difference()
  {

  cylinder(d=md+wth*2, h=mh+wth);
  translate([0,0,wth])
  cylinder(d=md, h=mh+.1);

  translate([-md,-md-5,wth])
  cube([md*2,md,mh+2]);

  translate([0,0,-1])
  cylinder(d=10, h=10);

  translate([10,0,-1])
  cylinder(d=5, h=10);

  translate([-10,0,-1])
  cylinder(d=5, h=10);
  }

}



module shaft_holder()
{
  translate([md/2,-5,0])
  tab();

  translate([-md/2,5,0])
  rotate(180)
  tab();

  translate([5,md/2,0])
  rotate(90)
  tab();

  translate([-5,-md/2,0])
  rotate(-90)
  tab();

  translate([md/2,-5,mh+wth])
  uptab();

  translate([-md/2,5,mh+wth])
  rotate(180)
  uptab();

  translate([5,md/2,mh+wth])
  rotate(90)
  uptab();



  difference()
  {

  cylinder(d=md+wth*2, h=mh+wth);
  translate([0,0,wth])
  cylinder(d=md, h=mh+.1);

  translate([-md,-md-5,wth])
  cube([md*2,md,mh+2]);

  translate([0,0,-1])
  cylinder(d=15, h=10);

  }

  bearing_holder(false);
}

module pulley()
{
  difference()
  {
    union()
    {
      cylinder(d1=pod, d2=pid, h=ph/2);
      translate([0,0,ph/2])
      cylinder(d2=pod, d1=pid, h=ph/2);
    }

    translate([0,0,-.5])
    cylinder(d=bid+bidg, h=ph+1, $fn=6);
  }
}


module smallpulley(give=0.5, roundhole=false)
{
  difference()
  {
    union()
    {
      cylinder(d1=spod, d2=spid, h=ph/2);
      translate([0,0,ph/2])
      cylinder(d2=spod, d1=spid, h=ph/2);
    }

    translate([0,0,-.5])
    if(roundhole)
      cylinder(d=mrd+give, h=ph+1);
	 else
      cylinder(d=mrd+give, h=ph+1, $fn=6);
  }
}

module tab()
{

  difference()
  {
  union()
  {
  cube([10,10,wth]);
  translate([10,5,0])
  cylinder(d=10, h=wth);
  }

  translate([10,5,-1])
  cylinder(d=shd, h=wth*2);
  }
}

module uptab()
{
  translate([0,0,-.5*wth])
  difference()
  {
  hull()
  {
  scale([1,1,.5])
  tab();
  translate([0,0,-12])
  cube([1,10,1]);
  }

  translate([10,5,-7])
  cylinder(d=shd, h=15);
  }
}


module bearing_holder(tabs=true)
{
  if(tabs)
  {
  translate([bd/2,-5,0])
  tab();

  translate([-bd/2,5,0])
  rotate([0,0,180])
  tab();

  translate([5,bd/2,0])
  rotate([0,0,90])
  tab();


  translate([-5,-bd/2,0])
  rotate([0,0,-90])
  tab();
  }

  difference()
  {
  cylinder(d=bd+wth*2, h=bh+wth);
  translate([0,0,wth])
  cylinder(d=bd+bg, h=bh+2);
  translate([0,0,-1])
  cylinder(d=15, h=bh+2);
  }



}

module gears(numt=8, p=.4, roundhole=false)
{
difference()
{
linear_extrude(height=10)
gear(number_of_teeth=numt, diametral_pitch=p, flat=true);
translate([0,0,-1])
if(roundhole)
  cylinder(d=bid+bidg,h=100);
else
  cylinder(d=bid+bidg,h=100, $fn=6);
}
}


module spacer(give=sg)
{
  difference()
  {
  cylinder(d=13, h=4);
  translate([0,0,-.1])
  cylinder(d=8+give, h=5, $fn=6);

  }

}

//gears(numt=24, roundhole=true);
/*
gears(numt=8);
translate([30,0,0])

difference()
{
scale(.95)
gears(numt=8);
cylinder(d=bid+bidg,h=100, $fn=6);
}
*/
//shaft_holder();
//bearing_holder();
//spacer(.63);
//motor_holder();
//shaft(length=75);

//uptab();
//tab();

//translate([0,50,0])
//pulley();
smallpulley(give=0, roundhole=true);
translate([30,0,0])
smallpulley(give=0.3, roundhole=true);
translate([30*2,0,0])
smallpulley(give=0.6, roundhole=true);
//translate([30*3,0,0])
//smallpulley(give=0.6, roundhole=true);


