width = 60;
height = 60;
th = 3;


module sida()
{
scale(1)
{
  cube([width,height,th]);

  //tvasaker
  union()
  {
    translate([width,0,0])
    cube([th,width/3,th]);
    translate([width, 2*height/3,0])
    cube([th,height/3,th]);
  }
  //ensak
  translate([-th, height/3,0])
  cube([th,height/3,th]);


  //nedatsaker
  translate([width/4-width/8, -th,0])
  cube([width/4,th,th]);

  translate([3*width/4-width/8, -th,0])
  cube([width/4,th,th]);
  
  
 } 
}

module bottendel()
{
  cube([width,height,th]);
  translate([2*width/4-width/8, -th,0])
  cube([width/4,th,th]);
 

  translate([4*width/4-width/8, -th,0])
  cube([width/8+th,th,th]);

  translate([-th, -th, 0])
  cube([width/8+th,th,th]);
 
 
  
}


module botten()
{
scale(1)
{
union()
{
translate([0,0,0])
bottendel();

translate([width,height,0])
rotate([0,0,180])
bottendel();

translate([width,0,0])
rotate([0,0,90])
bottendel();

translate([0,height,0])
rotate([0,0,-90])
bottendel();
}
}
}
translate([width+th*3,0,0])
botten();

sida();



//alla sidor!
/*
rotate([90,0,0])
{
sida();
translate([width+.1,0,0])
rotate([0,90,0])
sida();

translate([width+.1,0,-width-.2])
rotate([0,180,0])
sida();


translate([0,0,-width-.2])
rotate([0,-90,0])
sida();

}
*/