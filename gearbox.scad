include <involute_gears.scad>

pitch=.8;
bore_diam=5;
give=.2;
rgive=.5;

dist=19.2;

module gear1(teeth=10, pitch=.8, thickness=5)
{
difference()
{
gear(number_of_teeth=teeth, diametral_pitch=pitch, gear_thickness=thickness, hub_thickness=thickness, rim_thickness=thickness, bore_diameter=0, pressure_angle=28);

translate([0,0,-1])
cylinder(r=bore_diam/2+give, h=thickness+2, $fn=6);
}

}

//gear1(teeth=20);



//color("red")
//cube([10,10,10]);


module plate()
{
difference()
{
color("red")
cube([52,50,2]);

translate([15,12,0])
{

cylinder(r=bore_diam/2+rgive, h=5);


translate([0,dist,0])
cylinder(r=bore_diam/2+rgive, h=5);

translate([dist,0,0])
cylinder(r=bore_diam/2+rgive, h=5);

translate([dist,dist,0])
cylinder(r=bore_diam/2+rgive, h=5);
}


}


}
translate([15,12,0])
{
//plate();

/*
//first stage, shouldn't have
//same bore!
translate([0,0,4])
gear1(teeth=10);

//second stage
translate([dist,0,4])
gear1(teeth=20, thickness=5);
translate([dist,0,4+5])
gear1(teeth=10);


//third stage
translate([dist,dist,4+5])
gear1(teeth=20);
translate([dist,dist,4+5+5])
gear1(teeth=10);


//fourth stage
translate([0,dist,4+5+5])
gear1(teeth=20);
*/
}


module double_gear()
{
gear1(teeth=20);
translate([0,0,4.99])
gear1(teeth=10);
}


module pin_shaft(height=4*5+4, lip=2, base_height=4, notch_radius=.75)
{

//base
cylinder(r=bore_diam/2+lip, h=base_height);


difference()
{
//shaft
translate([0,0,base_height])
cylinder(r=bore_diam/2, h=height, $fn=6);


//cut
translate([-.5,-bore_diam/2,base_height+height-3.99])
cube([1,bore_diam,4]);


//notches
translate([-bore_diam/2,5,base_height+height-1.5])
rotate([90,0,0])
cylinder(r=notch_radius, h=10, $fn=4);

translate([bore_diam/2,5,base_height+height-1.5])
rotate([90,0,0])
cylinder(r=notch_radius, h=10, $fn=4);

}


}

module spacer(height=6)
{
difference()
{
cylinder(r=5, h=height);
cylinder(r=bore_diam/2+give, h=height+1, $fn=6);
}


}

module box()
{
plate();
translate([0,0,15+1+1+4])
plate();

//pillars
cube([4,4,15+1+1+4]);


}

//box();

plate();

translate([-60,0,0])
plate();


for(i=[0:3])
{
translate([i*10,80,0])
pin_shaft();

translate([i*12,95,0])
spacer();
}

translate([80,0,0])
double_gear();
translate([80,40,0])
double_gear();


translate([80,70,0])
gear1(teeth=20);



translate([80,95,0])
gear(number_of_teeth=10, diametral_pitch=pitch, bore_diameter=2.2, hub_thickness=5, rim_thickness=5, gear_thickness=5);
