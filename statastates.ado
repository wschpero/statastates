/*
statastates: Stata module for merging U.S. state identifiers
Authors: William L. Schpero and Domininkas Mockus
Contact: william.schpero@yale.edu; dmockus2@illinois.edu
Date: 050719
Version: 2.0
*/

capture program drop statastates
program define statastates

    version 12.1
    syntax, [Abbreviation(string) Fips(string) Name(string) ICPsr(string) NOGENerate]

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
 
  if "`nogenerate'" != "" {

	if "`abbreviation'" != "" {
	local abbrev "`abbreviation'"	
	rename `abbrev' state_abbrev
	replace state_abbrev=upper(state_abbrev)
	merge m:1 state_abbrev using "`c(sysdir_personal)'statastates_data/statastates.dta", nogen keep(match master)
	rename state_abbrev `abbrev'
	}

  else if "`fips'" != "" {
	local fips "`fips'"
	rename `fips' state_fips
	merge m:1 state_fips using "`c(sysdir_personal)'statastates_data/statastates.dta", nogen keep(match master)
	rename state_fips `fips'
	}

  else if "`name'" != "" {
	local name "`name'"
	rename `name' state_name
	replace state_name=upper(state_name)
	merge m:1 state_name using "`c(sysdir_personal)'statastates_data/statastates.dta", nogen keep(match master)
	rename state_name `name'
	}
	
  else if "`icpsr'" != "" {
	local icpsr "`icpsr'"
	rename `icpsr' state_icpsr
	merge m:1 state_icpsr using "`c(sysdir_personal)'statastates_data/statastates.dta", nogen keep(match master)
	rename state_icpsr `icpsr'
	}

  }

  else if "`abbreviation'" != "" {
	local abbrev "`abbreviation'"
	rename `abbrev' state_abbrev
	replace state_abbrev=upper(state_abbrev)
	merge m:1 state_abbrev using "`c(sysdir_personal)'statastates_data/statastates.dta"
	rename state_abbrev `abbrev'
	}

  else if "`fips'" != "" {
	local fips "`fips'"
	rename `fips' state_fips
	merge m:1 state_fips using "`c(sysdir_personal)'statastates_data/statastates.dta"
	rename state_fips `fips'
	}

  else if "`name'" != "" {
	local name "`name'"
	rename `name' state_name
	replace state_name=upper(state_name)
	merge m:1 state_name using "`c(sysdir_personal)'statastates_data/statastates.dta"
	rename state_name `name'
	}
	
  else if "`icpsr'" != "" {
	local icpsr "`icpsr'"
	rename `icpsr' state_icpsr
	merge m:1 state_icpsr using "`c(sysdir_personal)'statastates_data/statastates.dta"
	rename state_icpsr `icpsr'
	}

end
