$fn = 50;

//ball joint inner diameter
bjid = 10;

//ball joint wall thickness
bjwth = 1;

//give
g = .8;

//entry diameter
//ed = bjid-1-.2;
ed = bjid*.88;

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
    union()
    {
      rotate([0,-90,0])
      difference()
      {
        sphere(d=bjid+2*bjwth+give);
        sphere(d=bjid+give);

        translate([-bjid,-bjid+3,cd])
        cube([bjid*2,bjid*2,10]);
      }
    }

    translate([-bjid/2,-bjid/2,-bjid -bjwth + bc])
    cube([ll*2,bjid,bjid/2]);

    translate([-cd-.01,-sw/2,-bjid/2-bjwth])
    cube([sd,sw,bjwth*2+bjid+1]);
  }

}

module male()
{
  difference()
  {
  union()
  {

  rotate([0,90,0])
  cylinder(d=3.5, h=bjid/2+1.5);

  sphere(d=bjid);


  }
  translate([-bjid/2,-bjid/2,-bjid + bc])
  cube([ll*2,bjid,bjid/2]);

  }

}


module foot(give=g)
{
  female();


  difference()
  {

  translate([bjid/2+bjwth-3,0,0])
  hull()
  {
  translate([0,0,-bjid/2+bjwth+2])
  rotate([0,90,0])
  cylinder(d=8, h=5);

  translate([0,-4,-bjid/2+bjwth+2+20])
  rotate([0,90,0])
  cylinder(d=8, h=5);

  translate([0,4,-bjid/2+bjwth+2+20])
  rotate([0,90,0])
  cylinder(d=8, h=5);
  }

translate([-bjid/2,-bjid/2,-bjid -bjwth + bc])
    cube([ll*2,bjid,bjid/2]);

sphere(d=bjid+give);


  }
}

module pelvis(legdist = 25, height=8, thickness=10, give=g)
{

  difference()
  {
  hull()
  {
  cylinder(d=4, h=thickness);
  translate([legdist,0,0])
  cylinder(d=4, h=thickness);

translate([legdist/2,height,0])
  cylinder(d=10, h=thickness);
  }
  translate([0,-bjid/2,bjid/2+bjwth-bc])
  sphere(d=bjid+give);

  translate([legdist,-bjid/2,bjid/2+bjwth-bc])
  sphere(d=bjid+give);

translate([legdist/2,height+6,bjid/2+bjwth-bc])
  sphere(d=bjid+give);
  }

  translate([0,-bjid/2,bjid/2+bjwth-bc])
  rotate([0,0,90])
  female();

  translate([legdist,-bjid/2,bjid/2+bjwth-bc])
  rotate([0,0,90])
  female();


  translate([legdist/2,height+6,bjid/2+bjwth-bc])
  rotate([0,0,-90])
  female();

}


module arm(len=40, give=g)
{

  translate([bjid+bjwth -.5-1 + len,0,-bjwth])
  rotate([0,0,180])
  male();


  difference()
  {
  union()
  {
  female();
  translate([bjid/2+bjwth-3,0,-bjid/2-bjwth+5])
  rotate([0,90,0])
  cylinder(d=10, h=len);
  }

  translate([-bjid/2,-bjid/2,-bjid -bjwth + bc])
    cube([ll*2,bjid,bjid/2]);

  sphere(d=bjid+give);
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

//translate([0,0,bjid/2+bjwth-bc])
//female_leg(give=.85);

//translate([-10,0,bjid/2-bc])
//mirror([1,0,0])
//female_leg();

//female();


//foot();

//arm();

translate([0,40,bjid/2+bjwth-bc])
arm(len=30);
/*
translate([0,70,0])
arm(len=50);
*/

pelvis();