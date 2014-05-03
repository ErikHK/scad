//distance between legs
dl = 20;

//leg width
lw = 6;

//leg thickness
lth = 7;

//leg length
ll = 50;

//give between legs and legs

give = 1;



//legs
cube([lw, ll, lth]);
translate([dl,0,0])
cube([lw, ll, lth]);


//seat
translate([0,0,lth])
cube([dl+lw, 2*ll/5, 2]);


translate([-lw/2,0,lth+2])
rotate([-90,0,0])
linear_extrude(height=2*ll/5)
polygon(points=[[0,0],[lw,0],[lw,lw]]);



translate([lw/2+dl,0,lth+2-lw])
rotate([-90,-90,0])
linear_extrude(height=2*ll/5)
polygon(points=[[0,0],[lw,0],[lw,lw]]);



//back support
translate([50,0,0]){

//legs
cube([lw, ll*1.5, lth]);
translate([dl+lw*2+give*2,0,0])
cube([lw, ll*1.5, lth]);


//bars
translate([0,ll/4,lth])
cube([dl+lw*2+give*2+lw, lw, 3]);


translate([0,ll/2,0])
cube([dl+lw*2+give*2+lw, lw, 3]);

//seat
translate([0,ll*3/4,lth])
{
cube([dl+lw*3+give*2, ll*3/4, 2]);

}




}