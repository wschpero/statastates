# statastates

statastates is a simple Stata module for adding U.S. state identifiers (abbreviation, FIPS code, ICPSR code, and name) that may be missing from your dataset. My contribution to William Schpero's code was to add ICPSR functionality.

### Prerequisites

**Stata**: statastates should be compatible with Stata v12.1+. While it may be compatible with earlier versions, it has not been tested in those environments.

### Installation Options

**Github (for Stata v13.1+)**: Run the code below via the Stata command line.

	net install statastates, from(https://raw.github.com/dmockus2/statastates/master/) replace

**Github (for Stata v12.1+)**: [Download](https://github.com/dmockus2/statastates/archive/master.zip) the files above. Run the code below via the Stata command line, inserting the directory where you saved the files.

	net install statastates, from(<LOCAL PATH TO FILES>) replace

### Using statastates

statastates is pretty easy to use. Just run the command and include the relevant option, which is contingent on whether you would like to merge using the two-letter state abbreviation, FIPS code, name, or ICPSR code.

For example, if you have the state abbreviations in your dataset under the variable "state" and want to merge state FIPS codes and names using that variable, enter the following:

	statastates, abbreviation(state)

If you have the state FIPS codes in your dataset under the variable "state" and want to merge state abbreviations and names using that variable, enter the following:

	statastates, fips(state)

If you have the state names in your dataset under the variable "state" and want to merge state abbreviations and FIPS codes using that variable, enter the following:

	statastates, name(state)

Lastly, if you have the state ICPSR codes in your dataset under the variable "state" and want to merge state abbreviations and names using that variable, enter the following:

    statastates, icpsr(state)

By default, statastates will generate a new variable, `_merge`, to mark merge results. If you do not want to create this variable (and simply keep matched observations and unmatched master observations), specify the option `nogenerate`.

	statastates, name(state) nogenerate

### Common Issues

The first time statastates is run, it must create and save a .dta file with the state name / code information to your person .ado directory. If you get an error when you try to use the package along the lines of `file ...Documents/Stata/ado/personal/statastates_data/statastates.dta not found`, that suggests your Stata instance does not have the relevant read-write privileges for that folder. Once you fix those permissions, you should be all set. Otherwise, you can change the directory used for personal .ado files to a path where you know permissions are ok. See [https://kb.iu.edu/d/arur](https://kb.iu.edu/d/arur).

### Bug Reports

Please [let me know](https://github.com/dmockus2/statastates/issues) if you encounter any issues. Enjoy!
