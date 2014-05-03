// start and end point
tmin=0;
tmax=3*360;
// number of steps along path
tstep=100;

// path to extrude along
function x(t)=[
t*t,
t*abs(sin(t)),
t*cos(t)
];

// scale
function s(t)=30*t*t;//*cos(t-45);

function twist(t)=180*t/(tmax-tmin);



$fn=400;
linear_extrude(height=5, twist=30, scale=.1)
hej();
translate([0,0,-.5])
hej();

module hej(){
union() {
for(i=[1:11])
{
polygon(points=[[0,0],[0,3],[2,3.4]],paths=[ [0,1,2] ]);
rotate(30*i,[0,0,1])
polygon(points=[[0,0],[0,3],[2,3.4]],paths=[ [0,1,2] ]);
}
}
}

