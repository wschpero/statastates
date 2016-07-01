/*
statastates: Stata module for merging U.S. state identifiers
Author: William L. Schpero
Contact: william.schpero@yale.edu
Date: 070116
Version: 1.0
*/

capture program drop statastates
program define statastates
    version 12.1
    syntax, Identifier(string)
	quietly findfile statastates.dta
	merge m:1 `identifier' using "`r(fn)'"
end
