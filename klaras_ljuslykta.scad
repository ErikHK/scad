$fn=200;
inner_rad = 19;
thickness = 1;
rad = inner_rad + thickness;
height = 40;
small_rad = height/12;
large_rad = small_rad*sqrt(2);
bottom = small_rad;

difference()
{
	cylinder(r=rad, h=height, center=true);
	union()
	{
		translate([0,0,bottom])
		cylinder(r=inner_rad, h=height +0.1, center=true);
		for(i=[0:4])
		{
			translate([cos(i*90)*inner_rad, sin(i*90)*inner_rad, 0])
			rotate([90*sin(i*90),90*cos(i*90),0])
			cylinder(r=small_rad, h=thickness*2, center=true);
			translate([cos(i*90 + 45)*inner_rad, sin(i*90 + 45)*inner_rad, height/4])
			rotate([-45*cos(i*180),90,0])
			cylinder(r=small_rad, h=thickness*2, center=true);
			translate([cos(i*90 + 45)*inner_rad, sin(i*90 + 45)*inner_rad, -height/4])
			rotate([-45*cos(i*180),90,0])
			cylinder(r=small_rad, h=thickness*2, center=true);
			translate([cos(i*90 + 45)*inner_rad, sin(i*90 + 45)*inner_rad, 0])
			rotate([-45*cos(i*180),90,0])
			cylinder(r=large_rad, h=thickness*2, center=true);

		}	
	}
}