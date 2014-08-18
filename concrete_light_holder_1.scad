sphere(r=3, $fn=12);

minkowski()
{
linear_extrude(height=75)
import("star.dxf");

sphere(r=3, $fn=12);
}