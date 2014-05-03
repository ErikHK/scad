$fn=4;
//linear_extrude(height=1, convexity=10, center=true)

module hej(){
for(z=[0:5]){
rotate(z*360/6,[0,0,1])
translate([0,1,0])

cylinder(r=1, h=.1, center=true, $fn=3);
}
}
/*
translate([0,0,.1])
hej();
translate([0,0,.2])
rotate(.36,[0,0,1])
hej();
*/

/*
for(i=[0:100])
{
translate([0,0,.1*i])
rotate(i*3.6)
hej();
}
*/

linear_extrude(height=1)
{
hej();
}