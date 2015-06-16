$fn=140;
//$fa= 6;
//$fs = 100;
r1 = 100; //mm
h = r1-sqrt(r1*r1-(100*100)/4);

intersection()
{
rotate([0,90,0])
intersection()
{
translate([0,0,-.25])
cylinder(d1=92, d2=100-3, h=h);


translate([0,0,r1])
sphere(r=r1);


}

translate([-50,-50,0])
cube([100,100,100]);
}
echo(h);