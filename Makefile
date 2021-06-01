results.txt : data/isles.dat data/abyss.dat data/last.dat data/sierra.dat
	python scripts/testzipf.py $^ > $@

.PHONY : dats
dats : data/isles.dat data/abyss.dat data/last.dat data/sierra

data/isles.dat : books/isles.txt
	python scripts/countwords.py $< $@

data/abyss.dat : books/abyss.txt
	python scripts/countwords.py $< $@

data/last.dat : books/last.txt
	python scripts/countwords.py $< $@

data/sierra.dat : books/sierra.txt
	python scripts/countwords.py 	python scripts/countwords.py $< $@

.PHONY : clean
clean :
	rm -f data/*.dat
	rm -f results.txt
