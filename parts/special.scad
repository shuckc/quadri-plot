use <blocks.scad>;
use <base.scad>;


MarbleCatcher() MiniWhiteBlock() BlueBlock() GreenBlock();

translate([0,100,0]) MiniWhiteBlock() CylinderLadder();

translate([0,200,0]) Marble();


module MarbleCatcher() {
    color("orange")
    translate([75, 0]) {
        rotate_extrude()
        translate([50, 0, 0])
            chamfer_square(4,20, c=1);
        translate([0,0,4])
        cylinder(h=4, r=50);
        translate([-75,23,0])
            rotate([90,0,90])
                linear_extrude(height=30)
                    chamfer_square(4,20, c=1);
        translate([-75,-27,0])
                    rotate([90,0,90])
                        linear_extrude(height=30)
                            chamfer_square(4,20, c=1);

   };
   translate([75,0,16]) Marble();
   children();
}

module Marble() {
    sphere(r=8.25);
}

module CylinderLadder() {
    color("cyan") {
        MiniPurpleBlock();
        BlockUp(n=9) MiniWhiteBlock();
        // side supports
        translate([0,-16,11.5]) cylinder(r=2, h=100);
        translate([0,+16,11.5]) cylinder(r=2, h=100);
        // semicircular ladder shelves
        for (i=[0:4]) {
            translate([0,0,13.5+i*20])
            rotate([0,0,180*(i % 2)])
            difference() {
                rotate([0,8,0])
                cylinder(r=18,h=3, center=true);
                if (i > 0) translate([2,-25, -10]) cube(50);
            }
        }
    }
    // semi-transparent cylinder with front hole
    translate([0,0,11.5]) {
        color("yellow",.25)
        difference() {
            cylinder(r=20, h=100);
            translate([0,0,-10])
                cylinder(r=19, h=120);
            // z-6 seems like a fudge for the MiniPurple height?
            translate([0,0,-6])
                ExitSide();
        };
    }

}