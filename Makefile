include config.mk

# Generate summary table.
results.txt : $(ZIPF_SRC) data/isles.dat data/abyss.dat data/last.dat data/sierra.dat
	$(ZIPF_EXE) data/*.dat > $@

.PHONY : dats
dats : data/isles.dat data/abyss.dat data/last.dat data/sierra.dat

data/%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< data/$*.dat

.PHONY : clean
clean :
	rm -f data/*.dat
	rm -f results.txt
