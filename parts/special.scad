use <blocks.scad>;

MarbleCatcher() MiniWhiteBlock() BlueBlock();

module MarbleCatcher() {
    color("orange")
    translate([75, 0]) {
        rotate_extrude()
        translate([50, 0, 0])                    
            chamfer_square(4,20, c=1);
        translate([0,0,4])
        cylinder(h=t, r=50);
        translate([-75,23,0])
            rotate([90,0,90])
                linear_extrude(height=30)
                    chamfer_square(4,20, c=1);
        translate([-75,-27,0])
                    rotate([90,0,90])
                        linear_extrude(height=30)
                            chamfer_square(4,20, c=1);

   };
   children();
}

