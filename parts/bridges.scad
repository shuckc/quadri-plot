
use <blocks.scad>;

translate([000,000,36]) Curve2();
translate([000,000,12]) MiniPurpleBlock();
translate([000,000,24]) MiniPurpleBlock();

translate([000,000,36]) ProjectAlongArc(angle=120) Curve2();
translate([000,000,36]) ProjectAlongArc(angle=2*120) Curve2();

translate([000,000,0]) Curve3();
translate([000,000,0]) ProjectAlongArc(angle=180) Curve3();

translate([-230,000,88]) SCurve();

translate([500,0,0]) {
    MiniWhiteBlock() CurveSection(angle=60) {
        RedBlock() BlueBlock();
        GreenBlock() CurveSection(angle=60) {
            OrangeBlock(); WhiteBlock() MiniPurpleBlock();
        };
    }
}

translate([580,0,0]) {
    MiniWhiteBlock() CurveSection(angle=60, d=-1) {
        RedBlock() BlueBlock();
        GreenBlock() CurveSection(angle=60) {
            OrangeBlock() CurveSection(angle=60, d=-1) {}
            ; WhiteBlock() MiniPurpleBlock();
        };
    }
}

module ProjectAlongArc(angle=60, r=230, d=1) {
    translate([-r*d,0,0])
        rotate([0,0,d*angle])
            translate([r*d,0,0])
                children();
}

module CurveSection(angle=60, before=5, after=5, d=1) {
    rad=d*230;
    color("Wheat")
    difference() {
        union() {
            translate([-rad, 0])
                rotate([0,0,-d*before])
                    rotate_extrude(angle=d*(angle+before+after), convexity=10, $fa=5)
                        translate([rad, 0, 0])
                            translate([-22,0,0])
                            difference() {
                                chamfer_square(44,11.5);
                                translate([22-4, 0])
                                    square([8,12]);
                            }
            BaseStud();
            ProjectAlongArc(angle=60, d=d) BaseStud();
            if(angle>60)
                ProjectAlongArc(angle=120, d=d) BaseStud();
       }
       ProjectAlongArc(angle=0, d=d) TopEntry(height=12);
       ProjectAlongArc(angle=60, d=d) TopEntry(height=12);
       if (angle>60)
            ProjectAlongArc(angle=120, d=d) TopEntry(height=12);
    };
    MiniUp() {
        if ($children > 0) children(0);
        if ($children > 1) ProjectAlongArc(angle=60, d=d) children(1);
        if ($children > 2) ProjectAlongArc(angle=120, d=d) children(2);
    };
}

module SCurve() {
    union() {
        CurveSection(angle=60, before=0);
        rotate([0,0,180])
            CurveSection(angle=60, before=0);
    }
}

module Curve2() {
    CurveSection(angle=60) children();
}

module Curve3() {
    CurveSection(angle=120) children();
}
