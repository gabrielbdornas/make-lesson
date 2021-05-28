results.txt : dats
	python scripts/testzipf.py data/abyss.dat data/isles.dat data/last.dat > results.txt

.PHONY : dats
dats : isles.dat abyss.dat last.dat

isles.dat : books/isles.txt
	python scripts/countwords.py books/isles.txt data/isles.dat

abyss.dat : books/abyss.txt
	python scripts/countwords.py books/abyss.txt data/abyss.dat

last.dat : books/last.txt
	python scripts/countwords.py books/last.txt data/last.dat

.PHONY : clean
clean :
	rm -f data/*.dat
	rm -f results.txt
