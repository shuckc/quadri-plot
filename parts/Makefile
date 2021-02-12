
PNGS=$(patsubst %.scad,%.png,$(wildcard *.scad))

_%.png : %.scad .options
	openscad -o $@ `cat .options` $<

%.stl : %.scad .options
	openscad -o $@ `cat .options` $<

%.png : _%.png
	convert $< -scale 800x800 $@

all: $(PNGS) demo.stl
