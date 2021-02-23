Quadrilla parts
===============

Models for all the parts, as `openscad` objects. The scad files `blocks.scad` can then be imported into a layout.


Blocks
------
The shorted 'mini' pieces are grey and purple. Both are square, 12mm high, sides 44mm.

The grey piece:
  - has a hole 31mm in diameter throughout
  - there is a chamfer around all edges seemingly 2mm, so the distance accross the diagonal is 60.5mm

The purple piece has a thinner rectangular thickness 11.5mm
   the same 31mm hole extending 8mm from the face towards the centre, then it narrows to id 26mm
   On the back face, the same extrusion protrudes 6.5mm (od. 30mm) giving overall depth of 18mm.

The blocks are the height of five stacked purple pieces

Yellow block
  - rectangular profile: 60mm height, sides 44mm.
  - Circular protrusion 29mm od, 7mm high
    perhaps allow greater clearance for wooden parts (vs. plastic 30mm od, 6m5mm high)?
  - wooden blocks have a bigger chamfer, they are 59mm accross the diagonal
  - tunnel for marble is 19mm id at exit, centroid is 25mm down from top surface (35mm from base)
  - stud accepting recess is id 31mm, depth 9mm to shelf, then reduces down to 19mm
    all chamfered at 2mm

![blocks render](./blocks.png)

    MiniPurpleBlock
    MiniWhiteBlock

    BlueBlock
    GreenBlock
    OrangeBlock
    RedBlock
    TealBlock
    WhiteBlock (unpainted wood)
    YellowBlock

    clacker green
    clacker red
    clacker orange
    clacker blue
    clacker white

Bridges
-----
Bridges connect between one stack and another. They constrain the distances/placement of the stacks to a hexagonal grid (ie. tellelated equalateral triangles) with 230mm sides. This kind of grid is described precisely at https://www.redblobgames.com/grids/hexagons/. The basic ramps are a series of curve segments with two or three holes. The S-shaped curve spans three lengths in a straight line. The outer holes of the spiral piece fall on the same grid, but introduce a third hole at 185mm from the origin which is not aligned with any other piece.

![ramps render](./bridges.png)

    Curve2
    Curve3
    SCurve
    spiral

Special
-------
Marble is a sphere 16.5mm diameter

![special parts render](./special.png)

    MarbleCatcher()
    CylinderLadder()
    FlagTower()
    Marble()

    musical staircase
