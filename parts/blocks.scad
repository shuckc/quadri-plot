
BaseBlock();
translate([100,0,0]) ExitBase();
translate([200,0,0]) WhiteBlock();

translate([100,100,0]) ExitSide();
translate([200,100,0]) YellowBlock();

translate([100,200,0]) ExitSides();
translate([200,200,0]) RedBlock();


// basic block outer
module BaseBlock(height=60,side=44,chamfer=2) {
    difference() {
        union() {
            translate([0,0,height/2])
            cube([side,side,height], center=true);
            translate([0,0,-7]) 
                cylinder(h=7+2,d=29);
        }
        union() {
            translate([0,0,height-9])
                cylinder(h=10,d=31);
            translate([0,0,height-30])
                cylinder(h=30,d=19);
        }
    }
}

module ExitBase() {
    translate([0,0,-10])
        cylinder(h=50,d=19);
}
module ExitSide() {
    translate([0,40,5])
        rotate ([60,0,0])
        cylinder(h=50,d=19);
}

module WhiteBlock() {
    color("white")
    difference() {
        BaseBlock();
        ExitBase();
    }
}

module YellowBlock() {
    color("yellow")
    difference() {
        BaseBlock();
        ExitSide();
    }
}

module ExitSides() {
    union() {
        ExitSide();
        rotate ([0,0,90]) ExitSide();
    }
}

module RedBlock() {
    color("red")
    difference() {
        BaseBlock();
        ExitSides();
    }
}
