
//baser
translate([0,-5,0])
cube([10,10,3]);
translate([25,-5,0])
cube([10,10,3]);



//stakar
module stake()
{

difference()
{
  union()
  {

    translate([23,0,14])
    hallare();
    translate([17.5,0,20])
    hallare();
  }

    translate([32,2.5,0])
    rotate([0,-45,0])
    cylinder(r=2, h=30, $fn=5);
}

difference()
{

  difference()
  {
    union()
    {

    translate([2.5,3,2])
    rotate([90,0,0])
    linear_extrude(height=6)
    polygon(points=[[0,0],[5,0],[15,10],[15,20]]);
    }

    translate([5,0,0])
    rotate([0,45,0])
    cylinder(r=2, h=30, $fn=5);
}


//cylinders
union()
{
  translate([12,0,0])
  cylinder(r=1.55, h=20, $fn=20);
  translate([17.5,0,5])
  cylinder(r=1.55, h=20, $fn=20);
}

}
}

/*
difference()
{
  stake();
  translate([5,2,0])
  rotate([0,45,0])
  cylinder(r=2, h=30, $fn=5);
}
*/
//stake();

//finsaker
module finsak()
{
  translate([5,-2,2])
  rotate([0,40,0])
  linear_extrude(height=20, twist=360, slices=30)
  square(2.5, center=true);
}

  stake();


mirror([1,0,0])
translate([-35,0,0])
stake();

/*
finsak();
mirror([1,0,0])
translate([-35,0,0])
finsak();
*/

translate([0,4,0])
finsak();
mirror([1,0,0])
translate([-35,4,0])
finsak();

module hallare()
{
  difference()
  {
  cube([5,5,7], center=true);
  translate([0,0,-7])
  cylinder(r=1.55, h=15, $fn=20);
  }
}

//hallare();


//sidosak h
//translate([25,2.5,12])
//cube([5,5,8]);
//hallare();

//sidosak v
//translate([7,0,7])

//cube([5,5,8]);
//translate([10,2.5,2])
//cylinder(r=1.5, h=20, $fn=20);
