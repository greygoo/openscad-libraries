// Module for creating screw holes based on an array of [x,y,z] locations



module screw_holes(loc,dia,h,fn=32){
    for(l=loc){
        translate(l){
            cylinder(d=dia,h=h,$fn=fn);
        }
    }
}

module corner_latches(dim_b,loc_s,dia_s,space_s,height_s){
    //calculate corner points
    loc_c   = [[[0,0],[loc_s[0][0],0],[loc_s[0][0],loc_s[0][1]],[0,loc_s[0][1]]],
               [[loc_s[1][0],0],[dim_b[0],0],[dim_b[0],loc_s[1][1]],[loc_s[1][0],loc_s[1][1]]],
               [[loc_s[2][0],loc_s[2][1]],[dim_b[0],loc_s[2][1]],[dim_b[0],dim_b[1]],[loc_s[2][0],dim_b[1]]],
               [[0,loc_s[3][1]],[loc_s[3][0],loc_s[3][1]],[loc_s[3][0],dim_b[1]],[0,dim_b[1]]]]; // corners
    
    difference(){
        for(i=[0 : len(loc_c)-1]){
            hull(){
                linear_extrude(height_s)
                    polygon(points=loc_c[i]);
                translate(loc_s[i]){
                    cylinder(d=dia_s+space_s,h=height_s);
                }
            }
        }
    }
}
    