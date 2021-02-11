use <blocks.scad>;


translate([0,0,0]) MiniWhiteBlock() BlueBlock();
MarbleCatcher();

module MarbleCatcher() {
    color("orange")
    translate([75, 0]) {
        rotate_extrude()
        translate([50, 0, 0])                    
            chamfer_square(4,20, c=1);
        translate([0,0,4])
        cylinder(h=t, r=50);
   }
}

