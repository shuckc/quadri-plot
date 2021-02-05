
use <blocks.scad>;

translate([300,0,100]) Curve2();
translate([300,0,100]) ProjectAlongArc(angle=120) Curve2();
translate([300,0,100]) ProjectAlongArc(angle=2*120) Curve2();

translate([300,0,0]) Curve3();
translate([300,0,0]) ProjectAlongArc(angle=180) Curve3();

translate([500,0,0]) SCurve();

module ProjectAlongArc(angle=60, obj) {
    translate([-230,0,0])
        rotate([0,0,angle])
            translate([230,0,0])
                children();
}

module CurveSection(angle=60) {
    difference() {
        union() {
            translate([-230, 0])
                rotate([0,0,-5])
                    rotate_extrude(angle=angle+10, convexity=10, $fa=5)
                        translate([230-22, 0, 0])
                            square([44,12]);
            BaseStud();
            ProjectAlongArc(angle=60) BaseStud();
            if(angle>60)
                ProjectAlongArc(angle=1200) BaseStud();
       }
       ProjectAlongArc(angle=0) TopEntry(height=12);
       ProjectAlongArc(angle=60) TopEntry(height=12);
       if (angle>60)
            ProjectAlongArc(angle=120) TopEntry(height=12);
    }
}

module SCurve() {
    union() {
        CurveSection(angle=60);
        rotate([0,0,180])
            CurveSection(angle=60);
    }
}

module Curve2() {
    CurveSection(angle=60);
}

module Curve3() {
    CurveSection(angle=120);
}
