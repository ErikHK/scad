use <Thread_Library.scad>

$fn=100;

//////screw head//////

//screw head height
shh = 12.7;

//screw head diameter
shd = 20.9;

//screw head flange diameter
shfd = 22;

//screw head flange height
shfh = 2.1;

//screw head inner diameter
shid = 10.5;

//screw head inner diameter hole depth
shidhd = 11.9;

//screw head inner cross length
shicl = 15.0;

//screw head inner cross width
shicw = 4.6;

//////screw//////

//screw length
sl = 28.3;

//screw outer diameter
sod = 12.7;

//screw inner diameter
sid = 9.5;

//screw tpi
stpi = 6;

//screw thread width
stw = 2;


module insert()
{
    difference()
    {
        union()
        {
            cylinder(d=20, h=18);
            //cylinder(d=25, h=2);
        }
        trapezoidThreadNegativeSpace(   length=28.3, pitch=4.233,     pitchRadius=sod/2-.8, threadAngle=29, threadHeightToPitch=.35, clearance=0.3, countersunk=0.3);
    }
}

module head()
{
  difference()
  {
    union()
    {
      cylinder(d=shfd, h=shfh);
      translate([0,0,shfh])
        cylinder(d=shd, h=shh, $fn=6);
    }

  translate([0,0,shfh+shh-shidhd])
    cylinder(d=shid, h=100);

  translate([-shicl/2,-shicw/2,shfh+shh-shidhd])
  cube([shicl,shicw,100]);

  rotate(90)
  translate([-shicl/2,-shicw/2,shfh+shh-shidhd])
  cube([shicl,shicw,100]);

  }
}

pitch = 4;
angle = 45;


module screw()
{
trapezoidThread(length=28.3, pitch=4.233, pitchRadius=sod/2-.8, threadAngle=29, threadHeightToPitch=.35);

}


module wheel_screw()
{
    bh = 20;
    len = 20;
trapezoidThread(length=len, pitch=4.233, pitchRadius=sod/2-.8, threadAngle=29, threadHeightToPitch=.35);
    
    translate([0,0,len+bh])
    head();
    
    translate([0,0,len])
    cylinder(d=13.9, h=bh);
}

module wheel()
{
    difference()
    {
    
    union()
    {
        difference()
        {
            cylinder(d=75, h=20);
            translate([0,0,-1])
            cylinder(d=71, h=24);
        }
        
        cylinder(d=71, h=4);
    }
    
    cylinder(d=20, h=5);
    }

}

module wheel2()
{
    difference()
    {
        cylinder(d=75, h=25);
        cylinder(d=23, h=27);
    }
    
}


module tread(diam = 75)
{
    difference()
    {
        cylinder(d=79, h=25);
        translate([0,0,-1])
        cylinder(d=75, h=27);
    }
}

module tread_part(l=14, d=4)
{
    translate([0,l/2-d/2,0])
    rotate([90,0,0])
    {
        cylinder(d=d, h=l-d, $fn=25);
        sphere(d=d, $fn=25);
        translate([0,0,l-d])
        sphere(d=d, $fn=25);
    }
    
}

module tread_ring(num=22, angle=20, l=14, d=75)
{
    translate([0,0,0])
    for(i=[0:num])
    {
        
        rotate([0,360*i/num,0])
        translate([d/2+3.5, 0, 0])
        rotate([angle,0,0])
        tread_part(l=l);
    }
}

module tread_rings(d=75)
{
    l = 15;
    angle = 45;
    ol = 5;
    translate([0,-l/2,0])
    {
    tread_ring(angle = angle, l=l, d=d);
    translate([0,l-ol,0])
    rotate([0,360/44,0])
    tread_ring(angle=-angle, l=l, d=d);
    }
}

module bulgy_tread_big()
{
    difference()
    {
        
        intersection()
        {
            translate([0,0,25/2])
            sphere(d=82.9);
            cylinder(d=85, h=25);
        }
        
        
        translate([0,0,-1])
        cylinder(d=75, h=27);
    }

}

module bulgy_tread_small()
{
    difference()
    {
        
        intersection()
        {
            translate([0,0,25/2])
            sphere(d=50+7.9);
            cylinder(d=60, h=25);
        }
        
        
        translate([0,0,-1])
        cylinder(d=50, h=27);
    }

}



module full_tread_big()
{
    difference()
    {
        bulgy_tread_big();
        translate([0,0,25/2+5/2])
        rotate([90,0,0])
        tread_rings();
    }
}

module full_tread_small()
{
    difference()
    {
        bulgy_tread_small();
        translate([0,0,25/2+5/2])
        rotate([90,0,0])
        tread_rings(d=50);
    }
}

module small_mould()
{
    d = 67;
    
    difference()
    {
        union()
        {
            cylinder(d=d, h=25/2+2);
            
            translate([.707*d/2,.707*d/2,0])
            cylinder(d=10, h=25/2+2);
            translate([-.707*d/2,.707*d/2,0])
            cylinder(d=10, h=25/2+2);
            translate([-.707*d/2,-.707*d/2,0])
            cylinder(d=10, h=25/2+2);
            translate([.707*d/2,-.707*d/2,0])
            cylinder(d=10, h=25/2+2);
        }
    
        translate([0,0,2])
        bulgy_tread_small();
            
        cylinder(d=43, h=26);
            
        translate([.707*d/2,.707*d/2,0])
        cylinder(d=6, h=25/2+2);
        translate([-.707*d/2,.707*d/2,0])
        cylinder(d=6, h=25/2+2);
        translate([-.707*d/2,-.707*d/2,0])
        cylinder(d=6, h=25/2+2);
        translate([.707*d/2,-.707*d/2,0])
        cylinder(d=6, h=25/2+2);
    }
}


small_mould();

//wheel2();

//translate([0,0,-28.3-0])
//screw();


//translate([0,0,0])
//head();

//translate([30,0,0])
//insert();

//wheel_screw();

//difference()
//{


//full_tread_big();
//full_tread_small();

//tread_rings();
//}

//translate([0,0,-45])
//cylinder(d=9.3, h=20);
//cylinder(d=sod, h=20);