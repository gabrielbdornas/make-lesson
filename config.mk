# Python language
LANGUAGE=python

# Count words script.
COUNT_SRC=scripts/countwords.py
COUNT_EXE=$(LANGUAGE) $(COUNT_SRC)

# Test Zipf's rule
ZIPF_SRC=scripts/testzipf.py
ZIPF_EXE=$(LANGUAGE) $(ZIPF_SRC)
