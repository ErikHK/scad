middle = [49.395+.5, 47.792-4];

scale=1.333;

r=(21+3)*scale;
h=24*scale;

//whole height
wh = 75;



//translate([0,0,wh+4])
mirror([0,0,1])

difference()
{



translate([-8.1,-7.4,0])
translate(-middle)
scale([1.16,1.16,.99])
linear_extrude(height=wh)
import("star.dxf");


minkowski()
{

difference()
{
translate([0,0,-4])
translate(-middle)
linear_extrude(height=wh)
import("star.dxf");

translate([0,0,wh-h])
cylinder(r=r,h=h+20);

}

sphere(r=3, $fn=6);

}


translate([0,0,wh-h+4])
cylinder(r=r-4,h=h+20);

}




