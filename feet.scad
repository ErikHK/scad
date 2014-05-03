$fn=80;
rc1 = 10;
rc2 = 8;
hh = 10;
d = 6.5;
w = 6.5;

difference()
{
cylinder(r1=rc1, h=hh, r2=rc2);

translate([-w/2,-w/2,hh-d+.1])
cube([w,w,d]);
}