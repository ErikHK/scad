//jaw width
jw = 12-.4;

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
    translate([jw/2-3.9,5.75+4+4-.5,-6])
    cube([7.8, 4+.5, 6]);
 
     
    translate([jw/2,20,-8])
    rotate([90,0,0])
    cylinder(d=9, h=jmaxth+2);
       
    }
    }
    
    //grooves (fins)
    translate([0,0,2-.3])
    cube([2+.2,jl+1,2.5]);
    
    translate([jw-1.99-.2,0,2-.3])
    cube([2+.2,jl+1,2.5]);
    
    }
    
    
    
}

rotate([-90,0,0])

jaw();

