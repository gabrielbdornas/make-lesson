# Count words.
isles.dat : books/isles.txt
	python scripts/countwords.py books/isles.txt datas/isles.dat
