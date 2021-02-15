
module RZ(angle=90) {
    rotate([0,0,-angle]) children();
}

module MiniUp() {
    translate([0,0,12]) children();
}

module BlockUp(n=5) {
    translate([0,0,12*n]) children();
}

module ProjectAlongArc(angle=60, r=230, d=1) {
    translate([-r*d,0,0])
        rotate([0,0,d*angle])
            translate([r*d,0,0])
                children();
}
