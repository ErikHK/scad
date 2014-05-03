$fn=40;

union()
{
translate([16.088,16.092,4.9])
linear_extrude(height=5.1)
import(file="test_pendelur_2.dxf");



linear_extrude(height=5)
import(file="test_pendelur_1.dxf");
}
