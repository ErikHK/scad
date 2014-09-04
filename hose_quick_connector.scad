
$fn = 40;



module snap_connector(){
	difference() {
		union() {
			translate([0,0,25]) cylinder(h=1.5, r=15.7/2);
			translate([0,0,20]) cylinder(h=3.2, r=15.7/2);
			translate([0,0,19]) cylinder(h=3, r=17/2);
			translate([0,0, 6]) cylinder(h=2.88, r=19.5/2);
			cylinder(r=13/2, h=28);
			//cylinder(h=2.88, r=29/2);
			translate([0,0,26.5]) rotate_extrude(convexity = 10)
					translate([6.3, 0, 0])
					circle(r = 1.5);
			translate([0,0,9+2.88]) collar(3, 19.4);
			rotate([0, 180, 0])translate([0,0,-16]) collar(3, 17.2);
		}
		cylinder(r=9/2, h=29);
// Indent in base - remove if you are adding this to something else.
		//cylinder(r=18/2, h=1);
	}

/*
// Membrain, only needed if using indent above.
	translate([0, 0, 0.95])cylinder(r=26/2, h=0.2);
	rotate([0, 0,   0])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);
	rotate([0, 0,  90])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);
	rotate([0, 0, 180])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);
	rotate([0, 0, 270])translate([6 ,-1.3, 3])cube([3.7, 2.6, 3]);
*/
}

snap_connector();


