use <blocks.scad>;
use <base.scad>;

MarbleCatcher() MiniWhiteBlock() TealBlock()  BlueBlock()  CylinderLadder();

translate([0,100,0]) MiniWhiteBlock() CylinderLadder();

translate([0,200,0]) MiniWhiteBlock() GreenBlock() YellowBlock() RedBlock() ;

translate([0,-100,0]) FlagTower();

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

module FlagTowerTop(hf=30, h=65) {
    color("red") {
        cylinder(r=3, h=65);
        translate([0,0,h-hf]) flag(50,hf);
        // base minus three holes
        difference() {
            cylinder(r=27, h=3);
            union() {
                translate([-15,0,-1])
                    cylinder(r=9.5, h=5);
                translate([0,-15,-1])
                    cylinder(r=9.5, h=5);
                translate([0,+15,-1])
                    cylinder(r=9.5, h=5);
            }
        }
   }
}

module FlagTower() {
    translate([0,0,45])
        rotate([0,0,75])
        FlagTowerTop();
    color("red") {
        difference() {
            union() {
                cylinder(h=40, r1=22, r2=34);
                BaseStud();
            };
            union() {
                ExitPart();
                ExitSide(theta=130);
            }
        }
        translate([0,0,40])
        difference() {
            cylinder(h=4, r=34);
            translate([15,0,-1])
                cylinder(r=9.5, h=6);
        };
        translate([0,0,44])
        difference() {
            cylinder(h=20, r=32);
            translate([0,0,-1])
                cylinder(h=22, r=30);
        }
    }
}
module flag(w,h,d=3) {
    translate([0, 0.5*d,0])
    rotate([90,0,0]) linear_extrude(height=d)
        polygon(points=[[0,0],[w,0],[w*0.8,h*0.5],[w,h],[0,h]]);
}