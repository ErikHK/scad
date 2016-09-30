//jaw width
jw = 12;

//jaw length
jl = 35-17.25;

//jaw max thickness
jmaxth = 15;

//jaw medium thickness
jmedth = 15;

//jaw min thickness
jminth = 15;


module jaw()
{

    //fins
    //translate([0,5.75,0])
    //cube([jw, jl-5.75, 1.9]);
    

    difference()
    {
    
    union()
    {    
    intersection()
    {
    translate([jw/2,-1.75,0])
    rotate(45)
    cube([jw+2,jw+2,jmaxth+.1]);
    
    cube([jw, jl/3, jmaxth]);
    }
    
    translate([0,jl/3,0])
    cube([jw, jl/3, jmedth]);
    translate([0,2*jl/3,0])
    cube([jw, jl/3, jminth]);
    
    //guide
    difference()
    {
    translate([jw/2-4,5.75+4+4,-6])
    cube([8, 4, 6]);
 
     
    translate([jw/2,20,-8])
    rotate([90,0,0])
    cylinder(d=9, h=jmaxth+2);
       
    }
    }
    
    //grooves (fins)
    translate([0,0,2])
    cube([2,jl,2.5]);
    
    translate([jw-1.99,0,2])
    cube([2,jl,2.5]);
    
    }
    
    
    
}

jaw();

