/*
statastates: Stata module for merging U.S. state identifiers
Author: William L. Schpero
Contact: william.schpero@yale.edu
Date: 021617
Version: 1.2
*/

capture program drop statastates
program define statastates

    version 12.1
    syntax, [Abbreviation(string) Fips(string) Name(string)]
	
	cap quietly findfile statastates.dta, path("`c(sysdir_personal)'statastates_data/")

	if _rc==601 {
	preserve
	clear
	quietly findfile statastates_data.ado
	cap insheet using "`r(fn)'", tab
	cap mkdir "`c(sysdir_personal)'"
	cap mkdir "`c(sysdir_personal)'statastates_data"
	cap save "`c(sysdir_personal)'statastates_data/statastates.dta"
	restore
	}
	
	if "`abbreviation'" != "" {
	local abbrev "`abbreviation'"
	rename `abbrev' state_abbrev
	replace state_abbrev=upper(state_abbrev)
	merge m:1 state_abbrev using "`c(sysdir_personal)'statastates_data/statastates.dta"
	rename state_abbrev `abbrev'
	}
	
	if "`fips'" != "" {
	local fips "`fips'"
	rename `fips' state_fips
	merge m:1 state_fips using "`c(sysdir_personal)'statastates_data/statastates.dta"
	rename state_fips `fips'
	}
	
	if "`name'" != "" {
	local name "`name'"
	rename `name' state_name
	replace state_name=upper(state_name)
	merge m:1 state_name using "`c(sysdir_personal)'statastates_data/statastates.dta"
	rename state_name `name'
	}

end
