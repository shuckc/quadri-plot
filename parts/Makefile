
PNGS=$(patsubst %.scad,%.png,$(wildcard *.scad))

_%.png : %.scad .options
	openscad -o $@ `cat .options` $<
	# cp `awk '{print $$NF;}' $<` $(patsubst %.param,%.scad,$<)

%.png : _%.png
	convert $< -scale 800x800 $@

all: $(PNGS)
