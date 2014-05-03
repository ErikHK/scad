//distance between legs
dl = 24;

//leg width
lw = 6;

//leg thickness
lth = 6;

//leg length
ll = 60;

//give between legs and legs

give = .5;



//legs
cube([lw, ll, lth-2-give]);
cube([lw, 2*ll/5, lth-give]);
translate([dl,0,0])
{
cube([lw, 2*ll/5, lth-give]);
cube([lw, ll, lth-2-give]);
}

//seat
translate([0,0,lth-give])
cube([dl+lw, 2*ll/5, 2]);



translate([-lw/2,0,lth-give+2])
rotate([-90,0,0])
linear_extrude(height=2*ll/5)
polygon(points=[[0,0],[lw,0],[lw,lw]]);



translate([lw/2+dl,0,lth-lw-give+2])
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
translate([0,ll/4.5,lth])
cube([dl+lw*2+give*2+lw, lw, 3]);


translate([0,ll/2,0])
cube([dl+lw*2+give*2+lw, lw, 2]);

//seat
translate([0,ll*3/4,lth])
{
cube([dl+lw*3+give*2, ll*3/4, 2]);

}




}