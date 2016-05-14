//outer diameter
od = 40;

//tooth height
th = 5;

//tooth inner width
tiw = 6;

//tooth outer width
tow = 7;

//pulley thickness
pth = 25;

//internal bore
ib = 5;

module tooth()
{
linear_extrude(height=pth)
rotate(-90)
translate([-tow/2,-tiw/2,0])
polygon(points=[[0,0], [tow, 0], [(tow-tiw)/2, th], [tow-(tow-tiw)/2, th]], paths=[[0,1,3,2]]);
}

module pulley()
{
 lim = od/4;
    
ang = 360/lim;
 
 translate([0,0,2])
 difference()
 {   
union()
    {
        cylinder(d=od+10, h=2);
cylinder(d=od, h=pth);

cylinder(d=od-10, h=pth+10);

for(i=[0:od/4])
{
translate([(.5*od+th/2-1)*cos(ang*i), (.5*od + th/2-1)*sin(ang*i),0])
rotate(ang*i)
tooth();
}
}

cylinder(d=ib, h=pth+11);

}

}

pulley();