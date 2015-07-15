$fn = 20;

//bearing diameter
bd = 22;

//bearing height
bh = 7;

//bearing diameter give
bg = .5;

//motor diameter
md = 38;

//motor height
mh = 53;

//bearing inner diameter
bid = 8;

//bearing inner diameter give
bidg = .2;

//wall thickness
wth = 4;

//pulley height
ph = 6;

//pulley outer diameter
pod = 45;

//pulley inner diameter
pid = 40;

//screw hole diameter
shd = 3;


module shaft(length=70)
{
  translate([0,0,(sqrt(3)/2)*(bid-bidg)/2])
  rotate([90,0,0])
  cylinder(d=bid-bidg, h=length, $fn=6);
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
    cylinder(d=bid, h=ph+1, $fn=6);
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


module bearing_holder()
{
  translate([bd/2,-5,0])
  tab();

  translate([-bd/2,5,0])
  rotate([0,0,180])
  tab();
  difference()
  {
  cylinder(d=bd+wth*2, h=bh);
  translate([0,0,wth])
  cylinder(d=bd, h=bh+2);
  translate([0,0,-1])
  cylinder(d=bid+bidg, h=bh+2);
  }



}

//bearing_holder();
motor_holder();
//shaft();

//uptab();
//tab();

//translate([0,50,0])
//pulley();