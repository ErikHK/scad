$fn = 50;

//ball joint inner diameter
bjid = 10;

//ball joint wall thickness
bjwth = 1;

//give
g = .85;

//entry diameter
ed = bjid-1-.2;

//sagitta height
sh = bjid/2-sqrt((bjid/2)*(bjid/2) - ed*ed/4);

//cutoff distance
cd = bjid/2-sh;


//bottom cutoff
bc = .4+.3;

//leg length
ll = 30;

//leg width
lw = bjid-3;

//slot depth
sd = 3;

//slot width
sw = 1.5;



module female(give=g)
{

difference()
{
sphere(d=bjid+2*bjwth+give);
sphere(d=bjid+give);

translate([-bjid,-bjid+3,cd])
cube([bjid*2,bjid*2,10]);
}



}


module male_leg()
{
  difference()
  {
  union()
  {

  rotate([0,90,0])
  cylinder(d=3.5, h=bjid/2+1.5);

  sphere(d=bjid);

  translate([0,0,0])
  intersection()
  {
  translate([bjid/2+1,-lw/2,-bjid/2])
  cube([bjid+bjwth*2+ll,lw,bjid]);
  translate([bjid/2+1,0,0])
  rotate([0,90,0])
  cylinder(d=bjid, h=ll);
  }
  }
  translate([-bjid/2,-bjid/2,-bjid + bc])
  cube([ll*2,bjid,bjid/2]);

  }
}


module female_leg(give=g)
{
  
  difference()
  {
  union()
  {
  difference()
  {
  
  intersection()
  {
  translate([0,-lw/2,-bjid/2-bjwth])
  cube([bjid+bjwth*2+ll,lw,bjid+bjwth*2]);
  rotate([0,90,0])
  cylinder(d=bjid+bjwth*2, h=ll);
  }

  sphere(d=bjid+give);
  }
  rotate([0,-90,0])
  female(give);
  }

translate([-bjid/2,-bjid/2,-bjid -bjwth + bc])
  cube([ll*2,bjid,bjid/2]);

translate([-cd-.01,-sw/2,-bjid/2-bjwth])
  cube([sd,sw,bjwth*2+bjid+1]);
  }



}

//translate([0,0,bjid/2+bjwth-bc])
//female_leg(give=.8);

translate([0,0,bjid/2+bjwth-bc])
female_leg(give=.85);

translate([-10,0,bjid/2-bc])
mirror([1,0,0])
male_leg();

//female();