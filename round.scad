bottom = 25;
top = 23;
height = 3.5;
depth = 2.5;
thickness = 1;

difference() {
    cylinder(h = height, d1=bottom, d2=top, $fn=250);
    cylinder(h = depth, d1=bottom-(2*thickness), d2=top-(2*thickness), $fn=250);
}