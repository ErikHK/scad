use <../mek/screws.scad>

$fn= 40;
//diameter of hook
d = 10;

//thickness
th = 4;

//width
w = 15;

//tab length
tl = 20;

//hole diameter
hd = 3;


//disk diameter
dd = 100;

//ball diameter
bd = 550;



module hook()
{
difference()
{
cylinder(r=d/2+th, h=w);
cylinder(r=d/2, h=w);
translate([-d/2-th,0,0])
cube([d+th*2,d+th,w]);
}

difference()
{
translate([d/2,-th,0])
cube([tl+th, th, w]);

translate([d/2+th+tl/2,.1,w/2])
rotate([90,0,0])
cylinder(r=hd/2, h=th*2);
}
}

module disk()
{
R = bd/2;
c = dd;
echo(R);
echo(c);
h=R-sqrt(R*R-c*c/4);
echo(h);


difference()
{


intersection()
{
translate([0,0,-bd/2+h+1])
sphere(r=bd/2, $fn=200);
cylinder(r=dd/2, h=20);
}

translate([0,0,-.2])
cylinder(r=5, h=25);
}


//screw hole
difference()
{
screw(slanted_head=false, pitch=2.5, threaded_width=18, head_height=0, non_threaded_length=h, threaded_length=14);

translate([0,0,-1])
cylinder(r=5, h=25);

cube([20,3.5,50], center=true);
}


}

module cap()
{

nut(threaded_width=18+.2, nut_width=24, nut_height=14, pitch=2.5);

//thread(10,14,2.5,55,14, 1.5);

}

disk();
translate([80,0,0])
cap();
//hook();