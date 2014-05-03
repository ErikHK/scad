$fn = 40;

//CUSTOMIZER VARIABLES

width = 50;
height = 40;
depth = 12;

inner_height = 15;
inner_width = 13;

// Scale of the feet
foot_scale = 1.7;
// Height of the feet
foot_height = 5;

// The holes radius, I chose 3.1 because a LED is 6 mm.
hole_r = 3.1;

// Number of holes for LED lights.
num_holes = 5;

// Height of the holders.
holder_height=18;

// Thickness of the walls of the holders.
holder_thickness=.8;

// Size of the twisted thingies.
finsak_size=3;
///////////////////////////


hole_l = (width/2)/((num_holes+1)/2);


hwidth=width/2;

hypot = sqrt(hwidth*hwidth + height*height);


finsak_angle = atan(.5*width/height);

//degrad = pi/180;

//base
module base()
{
  translate([-inner_width*(foot_scale-1)/2,-depth*foot_scale/2,.8])
  cube([inner_width*foot_scale,depth*foot_scale,foot_height]);
}

module bases()
{
  base();
  translate([width-inner_width,0,0])
  base();  
}

/*
//stakar
module stake()
{

  difference()
  {

    difference()
    {
      union()
      {
        translate([0,depth/2,foot_height])
        rotate([90,0,0])
        linear_extrude(height=depth)
        polygon(points=[[0,0],[inner_width,0],[width/2,inner_height],[width/2, height]]);
      }

      translate([depth/2,0,0])
      rotate([0,45,0])
      cylinder(r=depth/3, h=height, $fn=5);
    }


    //cylinders
    union()
    {
      for(i=[1:num_holes])
      {
        translate([hole_l*i,0,0])
        cylinder(r=hole_r, h=height*2, $fn=30);
      }
    }
  }
}
*/

//stakar
module stake()
{
  difference()
  {

    union()
    {
      holder_one();
      finsaker();
      fix();
      translate([0,depth/2,foot_height-.1])
      rotate([90,0,0])
      linear_extrude(height=depth)
      polygon(points=[[0,0],[inner_width,0],[width/2,inner_height],[width/2, height]]);
    }
    
      
    union()
    {
      translate([depth/2,0,0])
      rotate([0,atan((hwidth-inner_width)/inner_height),0])

      cylinder(r=depth/3, h=height, $fn=5);
      for(i=[1:num_holes])
      {
        translate([hole_l*i,0,0])
        cylinder(r=hole_r, h=height*2, $fn=30);
      }
    }
    
  }
}


module stakar()
{
  stake();
  translate([width,0,0])
  rotate([0,0,180])
  stake();
}


//finsaker
module finsak()
{
  translate([0,-depth/2,foot_height])
  rotate([0,finsak_angle,0])
  linear_extrude(height=hypot, twist=360, slices=30)
  square(finsak_size, center=true);
}

module finsaker()
{
  finsak();
  translate([width,0,0])
  rotate([0,0,180])
  finsak();

  translate([0,depth,0])
  rotate([0,0,0])
  finsak();

  translate([width,-depth,0])
  rotate([0,0,180])
  finsak();  
}

module holder_one()
{
  for(i=[1:ceil(num_holes/2)])
  {
    translate([i*hole_l,0,i*hole_l*height/hwidth-6*height/width])
    difference()
    {
      cylinder(r=hole_r+holder_thickness, h=holder_height);
      translate([0,0,-1])
      cylinder(r=hole_r,h=holder_height+2);
    }
  }
}
/*
module holders()
{
  holder_one();
  translate([width,0,0])
  rotate([0,0,180])
  holder_one();
}
*/
//holders();




module fix()
{
  translate([hwidth,depth/2-finsak_size/2,height+foot_height])
  rotate([-90,180,0])
  linear_extrude(height=finsak_size)
  polygon(points=[[0,0],[-.5*finsak_size*cos(finsak_angle),.5*finsak_size*sin(finsak_angle)],[0,finsak_size*cos(finsak_angle)], [.5*finsak_size*cos(finsak_angle),.5*finsak_size*sin(finsak_angle)]]);
}

module fixes()
{
  fix();
  translate([0,-depth,0])
  fix();
}


//fixes();
stakar();
//finsaker();
bases();