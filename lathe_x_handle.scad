use <Thread_Library.scad>

//ball diameter
bd = 30;

//cylinder diameter
cd = 25;

//fastener length
fl = 30;

//fastener width
fw = 20;

//total width
tw = 80;

length=fl+bd/2+4;
pitch=3;
pitchRadius=6; 



module handle()
{
    difference()
    {
        union(){
            translate([-tw/2+bd/2,0])
            rotate([90,0,90])
            cylinder(d=cd, h=tw-bd);
            
            translate([tw/2-bd/2,0])
            sphere(d=bd);
            
            translate([-tw/2+bd/2,0])
            sphere(d=bd);
            
            translate([0,0])
            rotate([90,0,0])
            cylinder(d1=fw, d2=fw-3, h=fl);
        }
        
        translate([0,bd/2+2])
        rotate([90,0,0])
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
	clearance=0.3, 			// radial clearance, normalized to thread height
	backlash=0.3, 			// axial clearance, normalized to pitch
	stepsPerTurn=20 			// number of slices to create per turn
		);
        
        
    
    
    }
}

   

difference()
{
rotate([-90,0,0])
handle();

translate([-100,-100,-bd/2])
    cube([200, 200, 5]);
 
}