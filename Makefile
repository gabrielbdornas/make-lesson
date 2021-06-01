# Generate summary table.
results.txt : scripts/testzipf.py data/isles.dat data/abyss.dat data/last.dat data/sierra.dat
	python $< data/*.dat > $@

.PHONY : dats
dats : data/isles.dat data/abyss.dat data/last.dat data/sierra.dat

data/isles.dat : books/isles.txt scripts/countwords.py
	python scripts/countwords.py $< $@

data/abyss.dat : books/abyss.txt scripts/countwords.py
	python scripts/countwords.py $< $@

data/last.dat : books/last.txt scripts/countwords.py
	python scripts/countwords.py $< $@

data/sierra.dat : books/sierra.txt scripts/countwords.py
	python scripts/countwords.py $< $@

.PHONY : clean
clean :
	rm -f data/*.dat
	rm -f results.txt
