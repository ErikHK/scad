//distance between parts
distb = 1.5;

//length of part
le = 40;

//width of part
wi = 20;

//height of top part
he = 4;

//ridge height
rihe = 2;

//ridge width
riwi = 4;

//padding
p = 1;

//give between ridges and holes
g = .5;

//connection height
cohe = .76;

//thingy length
thle = 6;

//thingy width
thwi = 6;

//fastener give
fagi = 1.0;

//ridge dist from fastener
ridi = 5;


module top()
{

  difference()
  {
    cube([le,wi,he]);

    //ridge holes
    union()
    {
      translate([p+ridi,2*p-g,he-rihe-g])
      cube([le-2*p-ridi,riwi+2*g,he+1]);

      translate([p+ridi,wi-2*p-g-riwi,he-rihe-g])
      cube([le-2*p-ridi,riwi+2*g,he+1]);
    }
  }

//fastener thingy
translate([-thle,wi/2-thwi/2,0])
cube([thle,thwi,he]);

}

module bottom()
{
translate([distb+le,0,0])
cube([le,wi,he]);

//ridges
translate([distb+le+p+2*g,2*p,he])
cube([le-2*p-2*g-ridi,riwi,rihe]);

translate([distb+le+p+2*g,wi-riwi-2*p,he])
cube([le-2*p-2*g-ridi,riwi,rihe]);


//fastener thingy
difference()
{
  translate([2*le+distb,0,0])
  cube([thle,wi,he*3.3]);

  translate([2*le+distb-1,wi/2-thwi/2-fagi,he])
  cube([thle*2,thwi+2*fagi,he+2*fagi]);
}
}

module connection()
{
  translate([le,0,he-cohe])
  cube([2,wi,cohe]);
}

top();
bottom();
connection();