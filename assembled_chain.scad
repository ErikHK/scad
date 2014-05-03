$fa = 20;
$fs = 1.5;
$fn = 50;

handle_width = 30;
handle_length = 20;
handle_height = 8;
nub = 4; // hinge size
tol = .4; // spacing between hinge pieces
h_l = 2*nub; //hinge length


//num_links=5;
num_links_per_row=3;
num_rows = 5;
//num_rows = floor(num_links/num_links_per_row);
assembly();
test = num_links;
links = 0;

module assembly() {
  for(j=[1:num_rows-1])
  {
    for(i=[0:num_links_per_row-1])
    {
      translate([i*(handle_length+h_l*2),0,0])
      link();
    }
    
    if(j % 2 != 0)
    {
      translate([(num_links_per_row)*(handle_length+h_l*2)-h_l/2 ,0,4*nub*j])
      link_small();
    }

    
    for(i=[0:num_links_per_row-1])
    {
      if(j % 2 != 0)
      {
        mirror([1,0,0])
      
      translate([-i*(handle_length+h_l*2)-h_l*2.5,0,4*nub*j])
      link();
      }else{
        translate([i*(handle_length+h_l*2),0,4*nub*j])  link(); }
    }
    

    if(j % 2 == 0)
    {
      translate([0*(num_links_per_row)*(handle_length+h_l*2)-h_l/2 ,0,4*nub*j])
      link_small();
    }
  }
}

module link() {
union(){
cube([handle_length,handle_width,handle_height]);

translate([-h_l,handle_width-nub*2,nub])
hinge_m();

translate([-h_l,nub*2,nub]) mirror([0,1,0]) hinge_m();

//translate([0,0,0])        

// hinge
translate([handle_length+h_l,0,nub]) hinge_f();
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
    	rotate([0,0,0]) union(){
            translate([0,0,-nub]) cube ([h_l,nub*2, nub*2]);
            rotate([90,0,0]) {
                translate([0,0,-2*nub]) cylinder(r=nub,h=2*nub);
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




module hinge_f() {
    len = handle_width - 4*nub - 2*tol;
    translate([0,len+nub*2+tol,0])
    difference() {
        rotate([90,0,0]) 
        difference() {

            union() {
//translate([0,0,-handle_width+2*nub+tol])
                cylinder(r=nub, h=len);
translate([-h_l,-nub,0])
                cube([h_l,nub*2,len]);
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