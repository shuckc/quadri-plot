use <blocks.scad>;
use <bridges.scad>;
use <special.scad>;

RZ(-90) {
MiniWhiteBlock() CurveSection(angle=60, d=-1) {
    TealBlock() BlueBlock();
    GreenBlock() CurveSection(angle=60) {
        OrangeBlock() RZ(45) CurveSection(angle=60, d=-1) {}
        ; WhiteBlock() MiniPurpleBlock();
    };
}
ProjectAlongArc(angle=60, d=-1) { MiniWhiteBlock();
    ProjectAlongArc(angle=60, d=1)  MiniWhiteBlock()           MiniPurpleBlock() OrangeBlock();
    RZ(45) ProjectAlongArc(angle=60, d=-1)
      MiniWhiteBlock() MiniPurpleBlock() GreenBlock() MiniPurpleBlock() BlueBlock();

}
}
MarbleCatcher();
