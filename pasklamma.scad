//distance between parts
distb = 2;

//length of part
le = 50;

//width of part
wi = 10;

//height of top part
he = 3;

//ridge height
rihe = 2;

//ridge width
riwi = 2;

//padding
p = 1;

//give between ridges and holes
g = .4;

//connection height
cohe = .76;

//thingy length
thle = 2;

//thingy width
thwi = 5;

//fastener give
fagi = .3;


module top()
{

  difference()
  {
    cube([le,wi,he]);

    //ridge holes
    union()
    {
      translate([p,2*p-g,he-rihe-g])
      cube([le-2*p,riwi+2*g,he+1]);

      translate([p,wi-2*p-g-riwi,he-rihe-g])
      cube([le-2*p,riwi+2*g,he+1]);
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
cube([le-2*p-2*g,riwi,rihe]);

translate([distb+le+p+2*g,wi-riwi-2*p,he])
cube([le-2*p-2*g,riwi,rihe]);


//fastener thingy
difference()
{
  translate([2*le+distb,0,0])
  cube([thle,wi,he*3]);

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