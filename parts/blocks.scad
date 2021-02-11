
ChamferCube();
translate([0,100,0]) TopEntry();
translate([0,200,0]) BaseBlock();

translate([100,0,0]) ExitPart();
translate([200,0,0]) ExitOrange();
translate([300,0,0]) OrangeBlock();

translate([100,100,0]) ExitSide();
translate([200,100,0]) ExitYellow();
translate([300,100,0]) YellowBlock();

translate([100,200,0]) ExitSides();
translate([200,200,0]) ExitRed();
translate([300,200,0]) RedBlock();

translate([100,300,0]) ExitAcross();
translate([200,300,0]) ExitWhite();
translate([300,300,0]) WhiteBlock();

translate([100,400,0]) ExitBack();
translate([200,400,0]) ExitBlue();
translate([300,400,0]) BlueBlock();

translate([200,500,0]) ExitGreen();
translate([300,500,0]) GreenBlock();

translate([200,600,0]) ExitTeal();
translate([300,600,0]) TealBlock();

translate([300,700,0]) ControlBlock();

translate([400,0,0]) MiniPurpleBlock();
translate([400,100,0]) MiniWhiteBlock();

translate([400,200,0]) MiniWhiteBlock() MiniPurpleBlock() GreenBlock() OrangeBlock();

translate([400,300,0]) MiniWhiteBlock() GreenBlock() MiniPurpleBlock() RedBlock() BlueBlock() MiniPurpleBlock() OrangeBlock();

module MiniUp() {
    translate([0,0,12]) children();
}

module BlockUp() {
    translate([0,0,12*5]) children();
}

// basic block outer
module BaseCube(height=60,side=44) {
    //translate([0,0,height/2])
    //    cube([side,side,height], center=true);
    ChamferCube(height=height,side=side);
}

module chamfer_square(w,h,c=2) {
    // translate([w/2,0])
    polygon(points=[[c,0],[w-c,0],[w,c],[w,h-c],[w-c,h],[c,h],[0,h-c],[0,c]]);
}
module ChamferCube(height=60,side=44,chamfer=2) {
    translate([-side/2,-side/2])
    intersection() {
    linear_extrude(height=height)
        chamfer_square(side,side,chamfer);
    translate([side,0,0])
    rotate([0,-90,0]) linear_extrude(height=side)
        chamfer_square(height,side,chamfer);

    translate([0,0,0])
    rotate([-90,-90,0]) linear_extrude(height=side)
        chamfer_square(height,side,chamfer);
    }
}

module BaseStud() {
    translate([0,0,-7]) cylinder(h=7+2,d=29);
}

module BaseBlock(height=60,side=44,chamfer=2) {
    union() {
        BaseCube(height=height);
        BaseStud();
    }
}

module MiniPurpleBlock(height=11.5,side=44,chamfer=2) {
    color("purple")
    difference() {
        BaseBlock(height=height);
        TopEntry(height=height);
    }
    MiniUp() children();
}

module MiniWhiteBlock(height=11.5) {
    color("Wheat")
    difference() {
        BaseCube(height=height);
        translate([0,0,-2])
            cylinder(h=height+4,d=31);
    }
    MiniUp() children();
}

module TopEntry(height=60) {
    union() {
        translate([0,0,height-9])
            cylinder(h=10,d=31);
        translate([0,0,height-30])
            cylinder(h=30,d=19);
    }
}

module ExitPart() {
    union() {
    translate([0,0,30])
        sphere(d=19);
    translate([0,0,-10])
        cylinder(h=40,d=19);
    }
}

module ExitOrange() {
    union() {
        TopEntry();
        ExitPart();
    }
}

module ExitSide() {
    translate([0,0,30])
    rotate ([60,0,-90])
        translate([0,0,-30])
        ExitPart();
}

module ExitYellow() {
    union() {
        TopEntry();
        ExitSide();
    }
}

module OrangeBlock() {
    color("orange")
    difference() {
        BaseBlock();
        ExitOrange();
    }
    BlockUp() children();
}

module ExitAcross() {
    union() {
        translate([0,0,6])
        rotate ([90,90,0])
        translate([0,0,-40])
        cylinder(h=80,d=19);
    }
}

module ExitBack() {
    union() {
        translate([0,0,6])
        rotate ([0,90,0])
        translate([0,0,-40])
        cylinder(h=40,d=19);
    }
}

module ExitWhite() {
    union() {
        ExitOrange();
        ExitAcross();
    }
}

module WhiteBlock() {
    color("Wheat")
    difference() {
        BaseBlock();
        ExitWhite();
    }
    BlockUp() children();
}

module YellowBlock() {
    color("yellow")
    difference() {
        BaseBlock();
        ExitYellow();
    }
    BlockUp() children();
}

module ExitSides() {
    union() {
        ExitSide();
        rotate ([0,0,90]) ExitSide();
    }
}

module ExitRed() {
    union() {
        TopEntry();
        ExitSides();
    }
}

module RedBlock() {
    color("red")
    difference() {
        BaseBlock();
        ExitRed();
    }
    BlockUp() children();
}

module ExitBottom() {
    translate([0,0,-24]) ExitPart();
}

module ExitBlue() {
    union() {
        ExitYellow();
        ExitBottom();
        ExitBack();
    }
}

module BlueBlock() {
    color("blue")
    difference() {
        BaseBlock();
        ExitBlue();
    }
    BlockUp() children();
}

module ExitGreen() {
    union() {
        ExitYellow();
        ExitBottom();
        ExitAcross();
    }
}
module GreenBlock() {
    color("DarkGreen")
    difference() {
        BaseBlock();
        ExitGreen();
    }
    BlockUp() children();
}

module ExitTeal() {
    union() {
        ExitYellow();
        ExitAcross();
    }
}
module TealBlock() {
    color("Teal")
    difference() {
        BaseBlock();
        ExitTeal();
    }
    BlockUp() children();
}

module ExitControlBlock() {
    union() {
        ExitGreen();
    }
}

module ControlBlock() {
    color("White")
    difference() {
        BaseBlock();
        ExitControlBlock();
        // orange control knobs
    }
    BlockUp() children();
}
