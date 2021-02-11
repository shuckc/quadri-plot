
use <blocks.scad>;

translate([500,200,36]) Curve2();
//translate([500,200,12]) MiniPurpleBlock();
translate([500,200,24]) MiniPurpleBlock();

translate([500,200,36]) ProjectAlongArc(angle=120) Curve2();
translate([500,200,36]) ProjectAlongArc(angle=2*120) Curve2();

translate([500,200,0]) Curve3();
translate([500,200,0]) ProjectAlongArc(angle=180) Curve3();

translate([270,200,88]) SCurve();

translate([1000,0,0]) {
    // TODO: BUG? using Curve2 doesn't pass children correctly
    //Curve2(){
    //    RedBlock() BlueBlock();
    //    GreenBlock();
    //};
    CurveSection(angle=60) {
        RedBlock() BlueBlock();
        GreenBlock() CurveSection(angle=60) {
            OrangeBlock(); WhiteBlock() MiniPurpleBlock();
        };
    }
}

module ProjectAlongArc(angle=60, obj) {
    translate([-230,0,0])
        rotate([0,0,angle])
            translate([230,0,0])
                children();
}

module CurveSection(angle=60, before=5, after=5) {
    difference() {
        union() {
            translate([-230, 0])
                rotate([0,0,-before])
                    rotate_extrude(angle=angle+before+after, convexity=10, $fa=5)
                        translate([230-22, 0, 0])
                            chamfer_square(44,11.5);
            BaseStud();
            ProjectAlongArc(angle=60) BaseStud();
            if(angle>60)
                ProjectAlongArc(angle=1200) BaseStud();
       }
       ProjectAlongArc(angle=0) TopEntry(height=12);
       ProjectAlongArc(angle=60) TopEntry(height=12);
       if (angle>60)
            ProjectAlongArc(angle=120) TopEntry(height=12);
    };
    MiniUp() {
        if ($children > 0) children(0);
        if ($children > 1) ProjectAlongArc(angle=60) children(1);
        if ($children > 2) ProjectAlongArc(angle=120) children(2);
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
