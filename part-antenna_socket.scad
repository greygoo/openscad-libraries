// Part: Antenna socket

dia_as_screw            = 6.25;
height_as_screw         = 10.5;
dia_as_rim              = 9.25;
height_as_rim           = 2;
dia_as_foot             = 4;
height_as_foot          = 17.5;

function height_antenna_socket(height_as_screw,height_as_rim,height_as_foot) = height_as_screw + height_as_rim + height_as_foot;

//antenna_socket(h=height_as_screw);

module antenna_socket(h=10.5){
    cylinder(h=h,d=dia_as_screw);
    translate([0,0,h]){
        cylinder(h=height_as_rim,d=dia_as_rim);
        translate([0,0,height_as_rim]){
            cylinder(h=height_as_foot,d=dia_as_foot);
        }
    }
}

