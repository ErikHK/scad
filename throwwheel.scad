//bearing diameter
bd = 22;

//bearing height
bh = 7;

//bearing diameter give
bg = .5;

//motor diameter
md = 45;

//motor height
mh = 50;

//bearing inner diameter
bid = 8;

//bearing inner diameter give
bidg = .2;

//wall thickness
wth = 3.5;

//pulley height
ph = 6;

//pulley outer diameter
pod = 45;

//pulley inner diameter
pid = 40;


module shaft(length=70)
{
  translate([0,0,(sqrt(3)/2)*(bid-bidg)/2])
  rotate([90,0,0])
  cylinder(d=bid-bidg, h=length, $fn=6);
}

module motor_holder()
{
  module fasteners()
  {
    

  }


  translate([0,-md/2-wth,0])
  cube([120,md+wth*2,wth]);

  difference()
  {
  cylinder(d=md+wth*2, h=mh);
  translate([0,0,wth])
  cylinder(d=md, h=mh+.1);

  translate([-md,-md,wth])
  cube([md*2,md,mh+2]);
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

module bearing_holder()
{
  cylinder(d=bd+wth*2, h=bh);


}


motor_holder();
//shaft();

translate([0,50,0])
pulley();