include <roundCornersCube.scad>
//num of ice places in x
numx = 2;
//num of ice places in x
numy = 3;

//dist in x between ice things
dx = 4;

//dist in y between ice things
dy = 4;

//ice thing width
itw = 20;

//ice thing height
ith = 15;

//ice thing base width
itbw = 15;

//ice thing base height
itbh = 10;

//ice thing depth
itd = 10;

//tray top thickness
ttth = 3;

//thickness
th = 3;

//wall thickness of pla parts
wth = 1.5;

module ice_thing(padding=0)
{
  translate([th,th,0])
  polyhedron(points=[ [-padding,-padding,0],[itw+padding,-padding,0],[itw+padding,ith+padding,0], [-padding,ith+padding,0],

							[(itw-itbw)/2-padding,(ith-itbh)/2-padding,itd+padding],[itbw+(itw-itbw)/2+padding,(ith-itbh)/2-padding,itd+padding],[itbw+(itw-itbw)/2+padding,itbh+(ith-itbh)/2+padding,itd+padding],[(itw-itbw)/2-padding,itbh+(ith-itbh)/2+padding,itd+padding]],
				faces=[ [0,1,2,3], [4,5,1,0], [5,6,2,1], [7,4,0,3], [6,7,3,2], [7,6,5,4]  ]);
  
}

module top(padding)
{
  //
  difference()
  {
  translate([-wth,-wth,0])
  rCube(numx*(itw+th*2+dx)+wth*2, numy*(ith+th*2+dy)+wth*2,wth, 3);
translate([0,0,-wth])
  translate([dx/2,dy/2,0])
for( i=[0:numx-1])
  {
    for( j=[0:numy-1])
    {
      translate([i*(itw+th*2+dx), j*(ith+th*2+dy),0])
      {
        //difference()
        //{
        //ice_thing(padding);
        cube([itw+th*2,ith+th*2,5]);
        //}
      }
    }
  }

  }

}

module ice_tray(padding=0)
{


  top(padding);
  translate([dx/2,dy/2,wth])
  
  for( i=[0:numx-1])
  {
    for( j=[0:numy-1])
    {
      translate([i*(itw+th*2+dx), j*(ith+th*2+dy),0])
      {
        difference()
        {
        ice_thing(padding+wth);
        translate([0,0,-1])
        color([1,0,0,1])
        ice_thing(padding);
        }
      }
    }
  }
  
}

module walls()
{
  difference()
  {
  translate([-th,-th,0])
  rCube(numx*(itw+th*2+dx)+th*2, numy*(ith+th*2+dy)+th*2,wth+2, 3);
  rCube(numx*(itw+th*2+dx), numy*(ith+th*2+dy),wth+4, 3);
  }
}

//ice_tray();
//walls();
//color([1,0,1,.5])
translate([0,0,th])
ice_tray(padding=th);
//top(th);



//ice_thing();
//color([1,1,1,.5])
//ice_thing(padding=th);
