$fn=200;


module torus(r1, r2)
{
    rotate_extrude(convexity = 10, $fn = 110)
    translate([r1, 0, 0])
    circle(r = r2, $fn = 100);
    
}


difference()
{
cylinder(d=26, h=90);

translate([-20,35+1,20])
rotate([30])
cube([40,20,100]);
    

translate([-24,-15-10+1+1,0])
rotate([-3])
cube([40,10,100]);
    
    

translate([-20,-15-10+.5+3.5+1 ,65])
rotate([-6])
cube([40,10,100]);
    

translate([0,-220,0])
rotate([0,90,0])
torus(220, 7);


cylinder(r=9, h=15);
    
}

