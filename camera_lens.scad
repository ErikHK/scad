$fn = 80;
use <Thread_Library.scad>


length=85;
pitch=10;
pitchRadius=25; 

/*
translate([0,0,50])

difference()
{

rotate([90,0,0])
import("Nikon_Body_Cap_v2.stl");

translate([0,0,-3])
rotate([0,0,10])
cylinder(d=40.7, h=50);

translate([0,0,-10])
difference()
{
cylinder(d=60, h=60);

cylinder(d=47, h=60);


}


}
*/


module thread_negative(h=20, pitch=pitch, pitchRadius=pitchRadius)
{
//difference()
//{
//cylinder(d=57, h=80);


//cylinder(d=50.7, h=90);


trapezoidThreadNegativeSpace(
	length=h, 			// axial length of the threaded rod 
	pitch=pitch, 			// axial distance from crest to crest
	pitchRadius=pitchRadius, 	// radial distance from center to mid-profile
	threadHeightToPitch=0.3, 	// ratio between the height of the profile and the pitch 
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=80,			// angle between the two faces of the thread 
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	clearance=0.1, 			// radial clearance, normalized to thread height
	backlash=0.1, 			// axial clearance, normalized to pitch
	stepsPerTurn=40 			// number of slices to create per turn
		);

//}
}

module thread(pitchRadius=25, pitch=10, h=20, hole=40)
{
difference()
{
trapezoidThread(
	length=h, 			// axial length of the threaded rod 
	pitch=pitch, 			// axial distance from crest to crest
	pitchRadius=pitchRadius-.1, 	// radial distance from center to mid-profile
	threadHeightToPitch=0.3, 	// ratio between the height of the profile and the pitch 
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=80,			// angle between the two faces of the thread 
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	clearance=0, 			// radial clearance, normalized to thread height
	backlash=.2, 			// axial clearance, normalized to pitch
	stepsPerTurn=40 			// number of slices to create per turn
		);

translate([0,0,-1])
cylinder(d=hole, h=100);
}

}



module pie_slice(r=3.0,a=30, h=10) {
  $fn=64;
  intersection() {
    cylinder(r=r, h=h);
    cube([r,r,h]);
    rotate(a-90)     cube([r,r,h]);
  }
}



module f_mount()
{
  difference()
  {
  union()
  {
  cylinder(r=22, h=3.10);
  translate([0,0,3.10])
  cylinder(r1=23.2, r2=23.2, h=.5);
  translate([0,0,3.10+.5])
  cylinder(r=23.2, h=.5);

  rotate(92.2-5)
  pie_slice(r=23.2,a=5, h=4.10);




  }
  translate([0,0,-1])
  cylinder(d=35, h=20);

  translate([0,0,3.1-.1])
  rotate(92.2)
  difference()
  {
  pie_slice(r=23.25,a=62.037, h=3.1);
  cylinder(r=22, h=10);
  }

translate([0,0,3.1-.1])
  rotate(-23.4)
  difference()
  {
  pie_slice(r=23.25,a=58.06, h=3.1);
  cylinder(r=22, h=10);
  }

  translate([0,0,3.1-.1])
  rotate(0-62.037-70.6-23.4)
  difference()
  {
  pie_slice(r=23.25,a=62.037, h=3.1);
  cylinder(r=22, h=10);
  }


  }


}


//rotate([0,0,0])
module holder()
{

difference()
{
union()
{
translate([0,0,20+4.1+.4])
cylinder(r1=pitchRadius-.5, r2=22, h=2);

thread(h=20, pitchRadius=26);

translate([0,0,20+4.1+2])
f_mount();
}

translate([0,0,-1])
cylinder(d=35, h=45);

thread_negative(h=40, pitchRadius=20, pitch=6);
}



}


module retainer()
{


  
  difference()
  {
cylinder(d=24.5, h=13);
  cylinder(d=22, h=13);
  }

}


module small_lens_holder()
{
    difference()
    {
    union()
    {
        
        cylinder(r=23, h=0);
        translate([0,0,2])
        thread(h=-2+15, pitchRadius=20, pitch=6, hole=10);
        
    }   
    translate([0,0,3])
    cylinder(d=26, h=20);
    
    translate([0,0,-1])
    cylinder(d=21, h=20);

    
    translate([-40,-1.5,15.5])
    cube([80, 3, 20]);
    //translate([0,0,10])
    //thread_negative(h=20, pitchRadius=15, pitch=6);
    }
}


module small_holder(h=10)
{
    difference()
    {
    union()
    {
        
        cylinder(r=23, h=0);
        translate([0,0,2])
        thread(h=-2+h, pitchRadius=20, pitch=6, hole=10);
        
    }   
    translate([0,0,0])
    cylinder(d=26, h=20);
    
    translate([0,0,-1])
    cylinder(d=21, h=20);

    
    translate([-40,-1.5,h])
    cube([80, 3, 20]);

rotate([0,0,90])
translate([-40,-1.5,2])
    
    cube([80, 3, 2]);
    //translate([0,0,10])
    //thread_negative(h=20, pitchRadius=15, pitch=6);
    }
}



module big_holder(h=12)
{
    difference()
    {
    union()
    {
        
        cylinder(r=23, h=0);
        translate([0,0,2])
        thread(h=-2+h, pitchRadius=25.2, pitch=10, hole=10);
        
    }   
    translate([0,0,0])
    cylinder(d=38, h=20);
    
    translate([0,0,-1])
    cylinder(d=21, h=20);

    
    translate([-40,-1.5,h])
    cube([80, 3, 20]);

rotate([0,0,90])
translate([-40,-1.5,2])
    
    cube([80, 3, 2]);
    //translate([0,0,10])
    //thread_negative(h=20, pitchRadius=15, pitch=6);
    }
}


module super_small_lens_holder()
{
    difference()
    {
    union()
    {
        
        cylinder(r=23, h=0);
        translate([0,0,2])
        thread(h=-1.8+6, pitchRadius=20, pitch=6, hole=10);
        
        
    }   
    translate([0,0,4])
    cylinder(d=20, h=20);
    
    translate([0,0,-1])
    cylinder(d=16, h=20);
    
    //translate([0,0,10])
    //thread_negative(h=20, pitchRadius=15, pitch=6);
    }
}



module diverging_lens_holder()
{
    difference()
    {
    union()
    {
        
        cylinder(r=23, h=0);
        translate([0,0,2])
        thread(h=-3+25, pitchRadius=25.05, pitch=10, hole=10);
        
        
    }   
    translate([0,0,4])
    cylinder(d=37, h=26);
    
    translate([0,0,-1])
    cylinder(d=32.5, h=26);


    translate([-40,-1.5,27.5-3])
    cube([80, 3, 20]);
    
    //translate([0,0,10])
    //thread_negative(h=20, pitchRadius=15, pitch=6);
    }
}


module outer_holder()
{
difference()
    {

 translate([0,0,-1])
    cylinder(d=58, h=50);
        thread_negative(h=51, pitchRadius=25+.2, pitch=10, hole=10);
 
    }

}

translate([50,0,0])
//small_lens_holder();
//retainer();
//diverging_lens_holder();
//translate([0,80,0])
//outer_holder();
//f_mount();
//holder();
big_holder();

