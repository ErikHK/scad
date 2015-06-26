$fn = 40;

//hole diameter
hd = 3;

//num of holes around in the first row
noha = 6;

//num of hole rows
nohr = 4;

//hole rows distance
hrd = 10;

//sprinkler diameter
sd = 100;

//sprinkler head thickness
shth = 2.5;

//head thickness
hth = 2;

//fastener outer diameter
fod = 30;

//fastener height
fh = 30;

//fastener thickness
fth = 2;

//slit width
sw = 2;

//slit height
sh = 25;

//fastener inner diameter
fid = fod-fth*2;
echo(fid);



module sprinkler()
{
  difference()
  {
  cylinder(d=sd, h=shth);
  for(j=[0:nohr-1])
  {
  for(i=[0:(j+1)*(noha)])
  {
    translate([(hrd+j*hrd)*cos(i*360/(noha*(j+1))), (hrd+j*hrd)*sin(i*360/(noha*(j+1))), -.2])
    cylinder(d=hd, h=10);

  }
  }

    //middle hole
    translate([0,0,-.2])
    cylinder(d=hd, h=10);

 }
}


module head()
{
  difference()
  {
    cylinder(d1=sd, d2=fod, h=sd/2-fod/2);
    translate([0,0,-.1])
    cylinder(d1=sd-hth*2, d2=fod-hth*2, h=sd/2-fod/2+.2);
  }

}

module fastener()
{
  difference()
  {
  cylinder(d=fod, h=fh);
  translate([0,0,-.1])
  cylinder(d=fod-fth*2, h=fh+.2);

  translate([-sw/2,0,fh-sh+.1])
  cube([sw,fod/2+1,sh]);
  }



}


sprinkler();
translate([0,0,shth])
head();
translate([0,0,shth+(sd-fod)/2])
fastener();