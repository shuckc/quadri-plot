
FLAGS=--imgsize 2048,2048 --view=axes --viewall --autocenter

PNGS=$(patsubst %.scad,%.png,$(wildcard *.scad))

_%.png : %.scad .options
	openscad -o $@ $(FLAGS) $<

%.stl : %.scad .options
	openscad -o $@ $(FLAGS) $<

%.png : _%.png
	convert $< -scale 1024x1024 $@

all: $(PNGS) demo.stl
