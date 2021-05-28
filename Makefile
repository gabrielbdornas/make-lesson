.PHONY : dats
dats : isles.dat abyss.dat

isles.dat : books/isles.txt
	python scripts/countwords.py books/isles.txt data/isles.dat

abyss.dat : books/abyss.txt
	python scripts/countwords.py books/abyss.txt data/abyss.dat

.PHONY : clean
clean :
	rm -f data/*.dat
