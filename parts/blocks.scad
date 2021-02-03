
BaseBlock();
translate([0,100,0]) TopEntry();

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

translate([100,400,0]) ExitAcrossHalf();
translate([200,400,0]) ExitBlue();
translate([300,400,0]) BlueBlock();

// basic block outer
module BaseBlock(height=60,side=44,chamfer=2) {
    difference() {
        union() {
            translate([0,0,height/2])
            cube([side,side,height], center=true);
            translate([0,0,-7])
                cylinder(h=7+2,d=29);
        }
    }
}

module TopEntry(height=60) {
    union() {
        translate([0,0,height-9])
            cylinder(h=10,d=31);
        translate([0,0,height-30])
            cylinder(h=30,d=19);
    }
};

module ExitPart() {
    union() {
    translate([0,0,30])
        sphere(d=19);
    translate([0,0,-10])
        cylinder(h=40,d=19);
    };
};

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
};

module OrangeBlock() {
    color("orange")
    difference() {
        BaseBlock();
        ExitOrange();
    }
}

module ExitAcross() {
    union() {
        translate([0,0,6])
        rotate ([0,90,0])
        translate([0,0,-40])
        cylinder(h=80,d=19);
    }
}

module ExitAcrossHalf() {
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
};

module WhiteBlock() {
    color("Wheat")
    difference() {
        BaseBlock();
        ExitWhite();
    }
}

module YellowBlock() {
    color("yellow")
    difference() {
        BaseBlock();
        ExitYellow();
    }
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
};

module RedBlock() {
    color("red")
    difference() {
        BaseBlock();
        ExitRed();
    }
}

module ExitBlue() {
    union() {
        ExitYellow();
        translate([0,0,-24])
        ExitPart();
        ExitAcrossHalf();
    }
};

module BlueBlock() {
    color("blue")
    difference() {
        BaseBlock();
        ExitBlue();
    }
}
