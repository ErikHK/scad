$fn=80;

//inner radius
ir = 30.5;
//outer radius
or = 34.5;


w = 110+4;
h = 25;

th=3;

module ring()
{

difference()
{
cylinder(r=or, h=th);

cylinder(r=ir, h=th);
}


//flörps


for(i=[0:7])
{
rotate([0,0,i*45])
translate([ir-.7,0,0])
rotate([0,0,45])
cube([3,1,th]);

}


}

module holder()
{

difference()
{
translate([-w/2,-ir-2,0])
cube([w,h,th]);
cylinder(r=or,h=th);
}


//drop stop
translate([-w/8,-ir-2,th])
cube([w/4,2,2]);

//side holder
module side()
{
translate([-w/2,-ir-2,th])
cube([2,h,3]);

translate([-w/2,-ir-2,th+3])
cube([3,h,1]);

}

side();

mirror([1,0,0])
side();
}

holder();

ring();