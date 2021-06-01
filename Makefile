# Generate summary table.
results.txt : scripts/testzipf.py data/isles.dat data/abyss.dat data/last.dat data/sierra.dat
	python $< data/*.dat > $@

.PHONY : dats
dats : data/isles.dat data/abyss.dat data/last.dat data/sierra.dat

data/%.dat : books/%.txt scripts/countwords.py
	python scripts/countwords.py $< data/$*.dat

.PHONY : clean
clean :
	rm -f data/*.dat
	rm -f results.txt
