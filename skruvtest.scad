include <polyScrewThread_r1.scad>

PI = 3.14;

hex_screw(8,4,65,15,1.5,2,14,2,0,0);

translate([-25,-25,0])
hex_nut(14,8,4,65,8.5,0.5);


//hex_screw(8,4,55,20,1.5,2,24,8,30,0);
