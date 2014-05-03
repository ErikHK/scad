include <roundCornersCube.scad>

$fa = 20;
$fs = 1.5;
$fn = 50;

handle_width = 25;
handle_length = 20;
handle_height = 8;
nub = 4; // hinge size
tol = .6; // spacing between hinge pieces
h_l = 45; //hinge length





//num_links=5;
num_links_per_row=3;
num_rows = 1;
//num_rows = floor(num_links/num_links_per_row);
//assembly();
test = num_links;
links = 0;

module link() {
union(){
//cube([handle_length,handle_width,handle_height]);

translate([1,15,nub])
hinge_m();

translate([1,5,nub]) mirror([0,1,0]) hinge_m();

//translate([0,0,0])        

// hinge
translate([1,0,nub])
mirror([1,0,0])
hinge_f(45);
}
}




module link2() {
union(){
//cube([handle_length,handle_width,handle_height]);

translate([1,15,nub])
hinge_m();

translate([1,5,nub]) mirror([0,1,0]) hinge_m();

//translate([0,0,0])        

// hinge
translate([1,0,nub])
mirror([1,0,0])
hinge_f(13);
}
}


//height = 5*nub
module link_small() {

//translate([handle_length+4*nub,0,4*nub])
rotate([0,-90,0])
union(){
translate([-nub*1.5,0,0])
cube([nub,handle_width,handle_height]);

translate([-3*nub,handle_width-nub*2,nub])
short_hinge_m();

translate([-3*nub,nub*2,nub]) mirror([0,1,0]) short_hinge_m();

//translate([0,0,0])        

// hinge
translate([2*nub,0,nub]) short_hinge_f();
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


module short_hinge_m() {
    difference () {
    	rotate([0,0,0]) union(){
            translate([0,0,-nub]) cube ([nub*2,nub*2, nub*2]);
            rotate([90,0,0]) {
                translate([0,0,-2*nub]) cylinder(r=nub,h=2*nub);
    		    cylinder(r1=nub,r2=0,h=nub);
            }
    	}
        translate([-nub,-nub/2,-handle_height-nub*5]) cube([nub*5, nub*3, nub*5]);
    }
}




module hinge_f(hl=10) {
    //len = handle_width - 4*nub - 2*tol;
    len = 10-2*tol;
    translate([0,len+5+tol,0])
    difference() {
        rotate([90,0,0]) 
        difference() {

            union() {
//translate([0,0,-handle_width+2*nub+tol])
                cylinder(r=nub, h=len);
translate([-hl+nub,-nub,0])
                cube([hl,nub*2,len]);

translate([-hl+nub,0, 0])
                cylinder(r=nub, h=len, $fn=4);

            }

            translate([0,0,-0.1]) cylinder(r1=nub+tol,r2=0,h=nub);
            translate([0,0,len-nub+0.1]) cylinder(r1=0,r2=nub+tol,h=nub);
        }
        
    }
}



module short_hinge_f() {
    len = handle_width - 4*nub - 2*tol;
    translate([0,len+nub*2+tol,0])
    difference() {
        translate([-nub,0,0])
        rotate([90,0,0]) 
        difference() {

            union() {
//translate([0,0,-handle_width+2*nub+tol])
                cylinder(r=nub, h=len);
translate([-2*nub,-nub,0])
                cube([nub*2,nub*2,len]);
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
rCube(90,20,8,4);

union()
{
translate([5,5,-1])
rCube(50,10,12,1);

translate([65,5,-1])
rCube(20,10,12,1);



translate([59-nub,15,nub+.01])
rotate([90,0,0])
cylinder(r=nub, h=10, $fn=4);


}
}

translate([10,0,0])
link();


translate([80,0,0])
mirror([1,0,0])
link2();

}


body();

//link_small();