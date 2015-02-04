$fn=40;

//pulley outer diameter
pod = 80;

//pulley thickness
pth = 25;

//pulley hole diameter
phd = 22;

//pulley lid wall thickness
plwth = 4;

//pulley flange height
pfh = 4;

//pulley inner diameter 1
pid1 = 50;

//pulley inner diameter 2
pid2 = 45;

//pulley inner diameter height
pidh = (pth-pfh*2);

//pulley rod diameter
prd = 15;

//bearing height
bh = 7;



//give
g = .7;

difference()
{
union()
{
//flange
cylinder(d=pod,h=pfh);
translate([0,0,pfh])
cylinder(d1=pid1, d2=pid2, h=pidh/2);
translate([0,0,pfh+pidh/2])
cylinder(d2=pid1, d1=pid2, h=pidh/2);
}

translate([0,0,bh+(phd+g-prd)/2])
cylinder(d=phd+plwth*2, h=pth);


cylinder(d=prd, h=pth);

//bearing holder
cylinder(d=phd+g, h=bh);

translate([0,0,bh])
cylinder(d1=phd+g, d2=prd, h=(phd+g-prd)/2);
}



translate([100,0,0])
{
difference()
{
union()
{
//flange
cylinder(d=pod,h=pfh);
translate([0,0,pfh])
//cylinder(d=phd+plwth*2-g, h=pfh+(phd+g-prd)/2);
cylinder(d=phd+plwth*2-g, h=pth-(bh+(phd+g-prd)/2)-pfh);
}

translate([0,0,pth-bh])
cylinder(d=phd+g, h=pth);

cylinder(d=prd, h=pth+1);

cylinder(d=phd+g, h=bh);

translate([0,0,bh])
cylinder(d1=phd+g, d2=prd, h=(phd+g-prd)/2);

}




}

//test
/*
translate([100,0,pfh])
color("red")
cylinder(d=30, h=pth-(bh+(phd+g-prd)/2)-pfh);
*/