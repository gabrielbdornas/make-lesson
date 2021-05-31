results.txt : data/isles.dat data/abyss.dat data/last.dat data/sierra.dat
	python scripts/testzipf.py $^ > $@

.PHONY : dats
dats : data/isles.dat data/abyss.dat data/last.dat data/sierra

data/isles.dat : books/isles.txt
	python scripts/countwords.py books/isles.txt data/isles.dat

data/abyss.dat : books/abyss.txt
	python scripts/countwords.py books/abyss.txt data/abyss.dat

data/last.dat : books/last.txt
	python scripts/countwords.py books/last.txt data/last.dat

data/sierra.dat : books/sierra.txt
	python scripts/countwords.py books/sierra.txt data/sierra.dat

.PHONY : clean
clean :
	rm -f data/*.dat
	rm -f results.txt
