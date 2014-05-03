include <roundCornersCube.scad>

$fa = 20;
$fs = 1.5;
$fn = 50;

nub = 4; // hinge size
tol = .4; // spacing between hinge pieces

//stand width
sw = 10;

//stand length
sl = 65;

//support width
suw = 20;

//support length
sul = 17;

//distance between stands
dbs = 1.5;

//upper distance between wall and hinge
dswh = .5;

//side distance between wall and hinge
sdswh = .5;

//wall width
ww = 4;

//top wall width
tww = 2;


module link() {
  union(){
    translate([nub+dswh+tww,ww+sw+sdswh*2,nub])
    hinge_m();

    translate([nub+dswh+tww,ww,nub])
    mirror([0,1,0])
    hinge_m();

//translate([0,0,0])        

// hinge
translate([dswh+nub+tww,0,nub])
mirror([1,0,0])
hinge_f(sl);
}
}




module link2() {
union(){

translate([dswh,ww+sw/2+suw/2+sdswh*2,nub])
hinge_m();

translate([dswh,ww+sw/2+suw/2-suw,nub])
mirror([0,1,0])
hinge_m();

//translate([0,0,0])        

// hinge
translate([dswh,ww+sw/2+suw/2,nub])
//mirror([1,0,0])
hinge_f2(sul);

}
}

module hinge_m() {
    difference () {
    	union(){
            //translate([0,0,-nub]) cube ([h_l,nub*2, nub*2]);
            rotate([90,0,0]) {
                //translate([0,0,-2*nub]) cylinder(r=nub,h=2*nub);
    		    cylinder(r1=nub,r2=0,h=nub);
            }
    	}
        translate([-nub,-nub/2,-handle_height-nub*5]) cube([nub*5, h_l, nub*5]);
    }
}




module hinge_f(hl=10) {
    //len = handle_width - 4*nub - 2*tol;
    len = sw-2*tol;
    translate([0,ww+sw+sdswh-tol,0])
    difference() {
        rotate([90,0,0]) 
        difference() {

            union() {
//translate([0,0,-handle_width+2*nub+tol])
                cylinder(r=nub, h=len);
translate([-hl+nub,-nub,0])
                cube([hl-nub,nub*2,len]);

translate([-hl+nub,0, 0])
                cylinder(r=nub, h=len, $fn=4);

            }

            translate([0,0,-0.1]) cylinder(r1=nub+tol,r2=0,h=nub);
            translate([0,0,len-nub+0.1]) cylinder(r1=0,r2=nub+tol,h=nub);
        }
        
    }
}


module hinge_f2(hl=10) {

    len = suw-2*tol;
    translate([0,sdswh-tol,0])
    difference() {
        rotate([90,0,0]) 
        difference() {

            union() {

                cylinder(r=nub, h=len);


difference()
{
translate([-hl+nub,-nub,0])
cube([hl-nub,nub*2,len]);

translate([-hl+nub,0,0])
cylinder(r=nub, h=len, $fn=4);
}


            }

            translate([0,0,-0.1]) cylinder(r1=nub+tol,r2=0,h=nub);
            translate([0,0,len-nub+0.1]) cylinder(r1=0,r2=nub+tol,h=nub);
        }
        
    }
}





module body()
{

difference()
{
union()
{
rCube(sl+4,ww*2+sdswh*2+sw,8,4);

/*
translate([80,-10,0])
rCube(10,40,8,5);
*/

translate([sl,0+sw/2-suw/2,0])
//translate([sl,-ww,0])

//24
rCube(ww+tww+dswh*2+sul+.5,suw+ww*2+sdswh*2,8,4);
}


union()
{
translate([2,ww,-1])
rCube(sl+sul+dbs+2*dswh,sw+sdswh*2,12,1);

//translate([70,sdswh*2+sw/2-suw/2+ww,-1])

translate([sl+ww,ww+sdswh+sw/2-suw/2-sdswh,-1])


//translate([70,0,-1])
rCube(sul+dswh*2+.5,suw+2*sdswh,12,1);



/*
translate([50-nub,15,nub+.01])
rotate([90,0,0])
cylinder(r=nub, h=10, $fn=4);
*/

}
}

translate([0,0,0])
link();


translate([-nub-dswh+sul+sl+nub+dbs-dswh,0,0])
//mirror([1,0,0])
link2();

}


body();

//link_small();