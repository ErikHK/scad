$fn=50;

width = 20;
depth = 10;
height = 4;

peg_h = 2;


module base()
{
union()
  {
    cube([width,depth,height]);
    translate([width,depth/2,0])
    cylinder(r=depth/2,h=height);

    translate([0,depth/2,0])
    cylinder(r=depth/2,h=height);
  }
}

difference()
{
  base();

translate([width/4, depth/4, height-peg_h])
  scale([.5,.5,1.01*peg_h/height])

  union()
  {
    cube([width,depth,height]);
    translate([width,depth/2,0])
    cylinder(r=depth/2,h=height);

    translate([0,depth/2,0])
    cylinder(r=depth/2,h=height);
  }
}




translate([0,depth+5,0])
{
  base();
  translate([width/4,depth/4,height-.1])
  scale([.5,.5,peg_h/height])
  base();


}
