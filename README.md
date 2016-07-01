# statastates

statastates is a simple Stata module for adding U.S. state identifiers (abbreviation, name, and FIPS code) that may be missing from your dataset.

###Prerequisites

1. **Stata**: statastates should be compatible with Stata v12.1+. While it may be compatible with earlier versions, it has not been tested in those environments.

###Installation Options

**SSC Archive**: Run the code below via the Stata command line. [PENDING SUBMISSION TO SSC]
	
	ssc install statapush, replace

**Github (for Stata v13.1+)**: Run the code below via the Stata command line.

	net install statastates, from(https://raw.github.com/wschpero/statastates/master/) replace

**Github (for Stata v12.1+)**: [Download](https://github.com/wschpero/statastates/archive/master.zip) the files above. Run the code below via the Stata command line, inserting the directory where you saved the files.

	net install statapush, from(<LOCAL PATH TO FILES>) replace

###Using statapush

statastates is pretty easy to use. Just run the command below and indicate which kind of variable you would like to use to merge the state identifiers. The options include state abbreviation (specify state_abbrev), state name (specify state_name), or state FIPS code (use state_fips).

	statapush, identifier(state_abbrev)

Note that the name of the variable you are using for the merge in your master dataset must match the relevant variable in the statastates "using" dataset (i.e., state_abbrev, state_name, or state_fips).

###Bug Reports

Please [let me know](https://github.com/wschpero/statapush/issues) if you encounter any issues. Enjoy!
