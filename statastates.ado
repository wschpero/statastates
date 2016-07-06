/*
statastates: Stata module for merging U.S. state identifiers
Author: William L. Schpero
Contact: william.schpero@yale.edu
Date: 070616
Version: 1.1
*/

capture program drop statastates
program define statastates

    version 12.1
    syntax, [Abbreviation(string) Fips(string) Name(string)]
		
	if "`abbreviation'" != "" {
	local abbrev "`abbreviation'"
	rename `abbrev' state_abbrev
	replace state_abbrev=upper(state_abbrev)
	quietly findfile statastates.dta
	merge m:1 state_abbrev using "`r(fn)'"
	rename state_abbrev `abbrev'
	}
	
	if "`fips'" != "" {
	local fips "`fips'"
	rename `fips' state_fips
	quietly findfile statastates.dta
	merge m:1 state_fips using "`r(fn)'"
	rename state_abbrev `fips'
	}
	
	if "`name'" != "" {
	local name "`name'"
	rename `name' state_name
	replace state_name=upper(state_name)
	quietly findfile statastates.dta
	merge m:1 state_name using "`r(fn)'"
	rename state_abbrev `name'
	}

end
