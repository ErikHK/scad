include <polyScrewThread.scad>
use <../mek/screws.scad>
use <roundCornersCube.scad>

//wingnut height
wh = 20;

//wingnut length
wl = 20;

//wingnut radius
wr = 4;

//wingnut thickness
wth = 8;

screw(slanted_head=false, non_threaded_length=2, threaded_width=20, angle=45, head_width=35, head_height=10, threaded_length=50, pitch=3);

module wing()
{


  translate([-wth/2,35/2-4,wh])
  rotate([0,90,0])
    rCube(wh,wl,wth,wr);


}

translate([45,0,0])
{
wing();
translate([0,0,0])
rotate([0,0,180])
wing();
nut(threaded_width=21, nut_width=35, angle=45, nut_height=15, pitch=3);
}