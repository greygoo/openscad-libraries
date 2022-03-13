# Openscad Libraries
Just a bunch of openscad libraries

## cube_round_xy.scad
Module for creating a cube with rounded corners on x and y sides
```
cube_round_xy(dim,mki)
```
 dim	  - dimensions of cube as [x,y,z]
 mki	  - minkowski value to define rounding as int

## make_cuts-v2.scad
Module to create openings for a electronics board
make_cuts_v2(dim,cuts,length,extend,move,grow);
 d        - board dimension as [x,y,z]
 cuts     - array of cuts to be created as *see below*
 length   - length of the created cuts as float
 extend   - amount to extend outwards as float
 move     - move inwards(-)/outwards(+) as float

 cuts:
          [[[x,y],    // location
            [x,y],    // size
            side,     // side
            shape],   // shape
           [...],...]

      location:
          x/y coordinates of lower left of opening,
          meassured from the boards left top
      side:
          Side of the board, one of
          front,back,left,right,top,bottom
      shape:
          shape of the opening, one of
           square/rnd,
           sqr_cone/rnd_cone,
           sqr_indent/rnd_indent,
           sqr_button/rnd_button

**Example**
```
board_dim=[20,20,1.5];
length=5;
extend=7;
move=0;
grow=4;
cut_location=[0,0];
cut_size=[3,2];
cuts=[[cut_location,cut_size,"front","sqr"],
      [cut_location,cut_size,"back","sqr_cone"],
      [cut_location,cut_size,"left","sqr_indent"],
      [cut_location,cut_size,"right","sqr_button"],
      [cut_location,cut_size,"top","rnd_indent"],
      [cut_location,cut_size,"bottom","rnd_button"]];

cube(board_dim);
make_cuts_v2(dim=board_dim,
             cuts=cuts,
             length=length,
             extend=extend,
             move=move,
             grow=grow);
```

## screw_holes.scad
Module for creating screw holes based on an array of [x,y,z] locations
```
screw_holes(loc,dia,h,fn=32)
 loc: location as [x,y,z]
 dia: diameter as float
 h:   height as float
 fn:  faces as int
```
