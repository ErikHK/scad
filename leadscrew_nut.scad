use <Thread_Library.scad>
use <roundCornersCube.scad>

length=35;
pitch=3;
pitchRadius=6; 


module ett()
{

difference()
{
translate([-20,-10,0])
rCube(40, 20, 30, 1.5);

translate([0,0,-2])
trapezoidThreadNegativeSpace(
	length=length, 			// axial length of the threaded rod 
	pitch=pitch, 			// axial distance from crest to crest
	pitchRadius=pitchRadius, 	// radial distance from center to mid-profile
	threadHeightToPitch=0.5, 	// ratio between the height of the profile and the pitch 
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=30,			// angle between the two faces of the thread 
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	clearance=0.1, 			// radial clearance, normalized to thread height
	backlash=0.1, 			// axial clearance, normalized to pitch
	stepsPerTurn=20 			// number of slices to create per turn
		);
    
    
    translate([12,40,15])
    rotate([90,0,0])
    cylinder(d=6.5, h=200);
    
    translate([-12,40,15])
    rotate([90,0,0])
    cylinder(d=6.5, h=200);

}
}

module tva()
{
    
    difference()
    {
    cylinder(d1=17, d2=16, h=14);

translate([0,0,-2])
trapezoidThreadNegativeSpace(
	length=length, 			// axial length of the threaded rod 
	pitch=pitch, 			// axial distance from crest to crest
	pitchRadius=pitchRadius, 	// radial distance from center to mid-profile
	threadHeightToPitch=0.5, 	// ratio between the height of the profile and the pitch 
						// std value for Acme or metric lead screw is 0.5
	profileRatio=0.5, 			// ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
	threadAngle=30,			// angle between the two faces of the thread 
						// std value for Acme is 29 or for metric lead screw is 30
	RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
	clearance=0.2, 			// radial clearance, normalized to thread height
	backlash=0.2, 			// axial clearance, normalized to pitch
	stepsPerTurn=20 			// number of slices to create per turn
		);

    
    
    
}
    
}


//ett();
tva();